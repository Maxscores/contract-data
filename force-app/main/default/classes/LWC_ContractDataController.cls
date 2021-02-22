public without sharing class LWC_ContractDataController {
    @AuraEnabled(cacheable=true)
    public static List<Contract_Data__c> loadContractDataByAccount(String accountId){
        return [SELECT Id, Name, Review_Date__c FROM Contract_Data__c WHERE Account__c =: accountId];
    }
}
