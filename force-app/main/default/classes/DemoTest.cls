@isTest
private class DemoTest {
    @isTest
    static void testGetScheduleRequest() {
        // Create test data
        TestData preTest = preTest();

        Test.startTest();
        Scheduled_Request__c scheduleRequest = (Scheduled_Request__c) ScheduleRequestController.getScheduleRequest(
                preTest.scheduleRequest.Id
            )
            .result;
        // Assert.areEqual
        System.assertEquals(scheduleRequest.Amount__c, 100, 'Schedule Request account__c should be 100');
        Test.stopTest();
    }

    @isTest
    static void testInsertScheduleRequest() {
        Scheduled_Request__c scheduleRequest = new Scheduled_Request__c(
            Name = 'Schedule Request',
            Amount__c = 99,
            Schedule_Request_Type__c = 'One Time Wire'
        );

        Scheduled_Request__c result2 = (Scheduled_Request__c) ScheduleRequestController.insertScheduleRequest(
                scheduleRequest2
            )
            .result;
        // Assert.areEqual
        System.assertEquals(null, result2, 'result2 should be null');
        Test.stopTest();
    }

    /* ----preTest method---- */
    private static TestData preTest() {
        Scheduled_Request__c scheduleRequest = TestDataFactory.createScheduleRequest();
        return new TestData(scheduleRequest);
    }

    /* ----TestData class---- */
    private class TestData {
        private Scheduled_Request__c scheduleRequest { get; set; }

        private TestData(Scheduled_Request__c scheduleRequest) {
            this.scheduleRequest = scheduleRequest;
        }
    }
}
