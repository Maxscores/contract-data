public without sharing class LWC_ExternalDataController {
    @AuraEnabled
    public static List<External_Data__c> loadExternalDataByAccount(String accountId){
        return [SELECT Id, Name FROM External_Data__c WHERE Account__c =: accountId];
    }
}
