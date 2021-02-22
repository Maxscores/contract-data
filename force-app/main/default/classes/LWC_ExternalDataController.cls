public without sharing class LWC_ExternalDataController {
    @AuraEnabled
    public List<External_Data__c> string loadExternalDataByAccount(String accountId){
        try {
            return [SELECT Id, Name FROM External_Data__c WHERE Account__c =: accountId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
