public with sharing class ResponseWrapper {
    @AuraEnabled
    public Boolean isSuccess { get; set; }
    @AuraEnabled
    public String errorMsg { get; set; }
    @AuraEnabled
    public Object result { get; set; }

    public ResponseWrapper(Boolean status, Object obj) {
        isSuccess = status;
        errorMsg = status ? '' : String.valueOf(obj);
        result = status ? obj : null;
    }
}
