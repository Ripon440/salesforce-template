@isTest
public class RestGetCalloutTest {
    // Set some demo data for the test
    @TestSetup static void setup(){
        ServiceTokens__c token = new ServiceTokens__c();
        token.Name = 'ProjectServiceToken';
        token.Token__c = 'skahsafhsalkfsa';
        insert token;
    }

    @isTest static void testGetDataSuccess(){
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new RestGetCalloutMock());
        Test.startTest();
        ResponseWrapper response = RestGetCalloutHandler.getData();
        system.assert(response.isSuccess == true, 'Response should return true');
        Test.stopTest();
    }

    @isTest static void testGetDataFailure(){
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new RestGetCalloutMockFailure());
        Test.startTest();
        ResponseWrapper response = RestGetCalloutHandler.getData();
        System.assert(response.isSuccess == false, 'Response should return fail');
        System.assertEquals('Unauthorized', response.errorMsg, 'Response should return error message Unauthorized');
        Test.stopTest();
    }

    @isTest static void testGetCalloutSuccess() {
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new RestGetCalloutMock());

        Test.startTest();
        HttpResponse response = RestGetCallout.get();
        
        System.debug('response body -> ' + response.getBody());
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json', 'Content Type should be application/json');
        String actualValue = response.getBody();
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        System.assertEquals(expectedValue, actualValue, 'Response should have return actual value');
        System.assertEquals(200, response.getStatusCode(), 'Response should return 200 status code');
        Test.stopTest();
    }

    @isTest static void testGetCalloutFailure(){
        // set mock callout class
        Test.setMock(HttpCalloutMock.class, new RestGetCalloutMockFailure());
        // This causes a fake response to be sent from the class that implements HttpCalloutMock

        Test.startTest();
        HttpResponse response = RestGetCallout.get();
        System.debug('faile response => ' + response);
        System.assertEquals('Unauthorized', response.getStatus(), 'Response should return status Unauthorized');
        System.assertEquals(500, response.getStatusCode(), 'Response should return 500 status code');
        Test.stopTest();
    }
}
