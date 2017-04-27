"use strict";

var request = require('supertest');
describe('loading restify', function () {
  var server;
  beforeEach(function () {
    server = require('../index');
  });
  afterEach(function () {
    server.close();
  });

  
});