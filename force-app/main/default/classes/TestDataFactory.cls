@isTest
public class TestDataFactory {
    public static Scheduled_Request__c createScheduleRequest() {
        Scheduled_Request__c scheduleRequest = new Scheduled_Request__c(
            Name = 'Schedule Request',
            Amount__c = 100,
            Household__c = createHousehold('SH Household').Id,
            Frequency_of_Reoccurrence__c = 'Monthly',
            Frequency_of_Reoccurrence_Format__c = Constants.LAST_BUSINESS_DAY_OF_THE_MONTH,
            Start_Date_of_Reoccurrence__c = System.now().addHours(ScheduledRequestUtility.offsetHours()).dateGMT(),
            Schedule_Request_Type__c = 'One Time Wire'
        );
        insert scheduleRequest;
        return scheduleRequest;
    }
}
