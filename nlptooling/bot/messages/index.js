"use strict";

var builder = require("botbuilder");
var botbuilder_azure = require("botbuilder-azure");
var yaml = require('js-yaml');
var request = require('request');

var useEmulator = true;

var connector = useEmulator ? new builder.ChatConnector() : new botbuilder_azure.BotServiceConnector({
    appId: process.env['MicrosoftAppId'],
    appPassword: process.env['MicrosoftAppPassword'],
    stateEndpoint: process.env['BotStateEndpoint'],
    openIdMetadata: process.env['BotOpenIdMetadata']
});

var bot = new builder.UniversalBot(connector);

// Make sure you add code to validate these fields
var luisAppId = process.env.LuisAppId;
var luisAPIKey = process.env.LuisAPIKey;
var luisAPIHostName = process.env.LuisAPIHostName || 'api.projectoxford.ai';

const LuisModelUrl = 'https://' + luisAPIHostName + '/luis/v2.0/apps/' + luisAppId + '?subscription-key=' + luisAPIKey + '&verbose=true';

var recognizer = new builder.LuisRecognizer(LuisModelUrl);
var intents = new builder.IntentDialog({ recognizers: [recognizer] })
    .matches('DoesSatisfyControl', [
      function (session, args) {
        var product = builder.EntityRecognizer.findEntity(args.entities, 'Product');
        var control = builder.EntityRecognizer.findEntity(args.entities, 'Control');
        if (product && control) {
          // If DDC, create dialog

          parseProduct(product.entity, (productName, componentFileUrl) => {
            if (productName) {
              session.send(`I see you requested information as to whether ${productName} satisfies control ${control.entity.replace(/ /g,'').toUpperCase()}. Let me check on that.`);
              request(componentFileUrl, function (error, response, body) {
                if (!error && response.statusCode == 200) {
                  var doc = yaml.safeLoad(body);
                  var controlKey = control.entity.replace(/ /g,'').toUpperCase();
                  for (const control of doc.satisfies) {
                    if (control['control_key'].replace(/ /g,'') == controlKey) {
                      session.send(`${productName} does indeed satisfy control ${controlKey}`);
                      return;
                    }
                  }
                  session.send(`Control ${controlKey} does not apply to ${productName}.`);
                }
              });
            } else {
              session.send("Sorry, I don't recognize that component.");
            }
          });
        }
      }
    ])
    .matches('HowDoesSatisfyControl', [
      function (session, args) {
        var product = builder.EntityRecognizer.findEntity(args.entities, 'Product');
        var control = builder.EntityRecognizer.findEntity(args.entities, 'Control');
        if (product && control) {
          // If DDC, create dialog

          parseProduct(product.entity, (productName, componentFileUrl) => {
            if (productName) {
              session.send(`I see you requested information as to how ${productName} satisfies control ${control.entity.replace(/ /g,'').toUpperCase()}. Let me check on that.`);
              request(componentFileUrl, function (error, response, body) {
                if (!error && response.statusCode == 200) {
                  var doc = yaml.safeLoad(body);
                  var controlKey = control.entity.replace(/ /g,'').toUpperCase();
                  for (const control of doc.satisfies) {
                    if (control['control_key'].replace(/ /g,'') == controlKey) {
                      session.send(`${productName} satisfies control ${controlKey} as follows:`);
                      for (const narrative of control['narrative']) {
                        session.send(narrative['text']);
                      }
                      return;
                    }
                  }
                  session.send(`Control ${controlKey} does not apply to ${productName}.`);
                }
              });
            } else {
              session.send("Sorry, I don't recognize that component.");
            }
          });
        }
      }
    ])
    .matches('Help', builder.DialogAction.send(`You can ask questions like:

      How does Docker Datacenter satisfy control AC-11?
      Does Docker Trusted Registry meet the requirements of CM-2?
    `))
    .onDefault((session) => {
      session.endConversation();
    });

bot.dialog('/', intents);

function parseProduct(product, callback) {
  switch (product) {
    case ("ucp" || "universal control plane"):
      return callback("Universal Control Plane", 'https://raw.githubusercontent.com/docker/ddc-opencontrol/master/UCP/component.yaml');
    case ("dtr" || "docker trusted registry"):
      return callback("Docker Trusted Registry", 'https://raw.githubusercontent.com/docker/ddc-opencontrol/master/DTR/component.yaml');
    case "cs engine":
      return callback("Commerically Supported Docker Engine", 'https://raw.githubusercontent.com/docker/ddc-opencontrol/master/CSEngine/component.yaml');
    default:
      return callback();
  }
}

if (useEmulator) {
    var restify = require('restify');
    var server = restify.createServer();
    var port = process.env.TARGET_PORT || 3978
    server.listen(port, function() {
        console.log(`test bot endpont at http://localhost:${port}/api/messages`);
    });
    server.post('/api/messages', connector.listen());
    module.exports = server;
} else {
    module.exports = { default: connector.listen() };
}