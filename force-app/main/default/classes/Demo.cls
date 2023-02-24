public with sharing class Demo {
    @AuraEnabled
    public static ResponseWrapper getScheduleRequest(String scheduleReqId) {
        try {
            // get the schedule request using strip inaccessible
            SObjectAccessDecision securityDecision = Security.stripInaccessible(
                AccessType.READABLE,
                [
                    SELECT Id, Name
                    FROM Scheduled_Request__c
                    WHERE Id = :scheduleReqId
                ]
            );

            // check if any accessible records were returned
            if (securityDecision.getRecords().size() > 0) {
                return new ResponseWrapper(true, securityDecision.getRecords()[0]);
            }

            return new ResponseWrapper(false, 'No schedule request record found!');
        } catch (Exception exp) {
            return new ResponseWrapper(false, exp.getMessage());
        }
    }

    @AuraEnabled
    public static ResponseWrapper insertScheduleRequest(Scheduled_Request__c scheduleRequest) {
        try {
            SObjectAccessDecision securityDecision = Security.stripInaccessible(
                AccessType.CREATABLE,
                new List<Scheduled_Request__c>{ scheduleRequest }
            );
            insert securityDecision.getRecords();

            return new ResponseWrapper(true, securityDecision.getRecords()[0]);
        } catch (Exception exp) {
            return new ResponseWrapper(false, exp.getMessage());
        }
    }

    @AuraEnabled
    public static ResponseWrapper updateScheduleRequest(Scheduled_Request__c scheduleRequest) {
        try {
            SObjectAccessDecision securityDecision = Security.stripInaccessible(
                AccessType.UPDATABLE,
                new List<Scheduled_Request__c>{ scheduleRequest }
            );

            update securityDecision.getRecords();

            return new ResponseWrapper(true, securityDecision.getRecords()[0]);
        } catch (Exception exp) {
            return new ResponseWrapper(false, exp.getMessage());
        }
    }
}
