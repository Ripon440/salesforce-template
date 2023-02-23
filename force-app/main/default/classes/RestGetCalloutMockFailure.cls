@isTest
global class RestGetCalloutMockFailure implements HttpCalloutMock {
    //Implement http mock callout failure here
    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setStatus('Unauthorized');
        response.setStatusCode(500);
        return response;
    }
}
