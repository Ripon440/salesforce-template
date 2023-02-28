public with sharing class ProjectController {
    // Retrieve project based on project id
    @AuraEnabled(cacheable=false)
    public static ResponseWrapper getProject(String projectId) {
        List<Project__c> projectList = [
            SELECT Id, Name, Delivery_Date__c
            FROM Project__c
            WHERE Id = :projectId
            WITH SECURITY_ENFORCED
        ];
        if (projectList.size() <= 0) {
            return new ResponseWrapper(false, 'Data not found.');
        }
        return new ResponseWrapper(true, projectList[0]);
    }
}
