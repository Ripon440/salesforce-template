public with sharing class RestGetCallout {
    public static HttpResponse get(){
        String endPoint = 'https://th-apex-http-callout.herokuapp.com/animals';
        String accessToken = ServiceTokens__c.getValues('ProjectServiceToken')?.Token__c;
        String authorizationHeader = 'Bearer ' + accessToken;

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', authorizationHeader);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        Http http = new Http();
        HttpResponse response = http.send(request);
        
        return response;
    }
}