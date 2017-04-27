class MockResponse {
    constructor(context) {
        this.context = context;
    }

    status(val) {
        if (val === undefined) {
            return this._status;
        }
        else {
            this._status = val;
        }
    }
    
    send(status, body) {
        if (body === undefined) {
            this._body = status;
            this.status(200);
        }
        else {
            this.status(status);
            this._body = body;
        }
    }

    end() {
        this.context.done();
    }
}

module.exports = MockResponse;