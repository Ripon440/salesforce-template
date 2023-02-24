public with sharing class ResponseWrapper {
    // Check if the response is success or not
    @AuraEnabled
    public Boolean isSuccess { get; set; }
    // If the response is not success, then this will contain the error message
    @AuraEnabled
    public String errorMsg { get; set; }
    // If the response is success, then this will contain the result
    @AuraEnabled
    public Object result { get; set; }

    // Constructor for ResponseWrapper class
    public ResponseWrapper(Boolean status, Object obj) {
        isSuccess = status;
        errorMsg = status ? '' : String.valueOf(obj);
        result = status ? obj : null;
    }
}
