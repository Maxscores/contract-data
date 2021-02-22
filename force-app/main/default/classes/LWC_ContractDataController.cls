public without sharing class LWC_ContractDataController {
    @AuraEnabled
    public static List<Contract_Data__c> loadContractDataByAccount(String accountId){
        try {
            return [SELECT Id, Name, Review_Date__c FROM Contract_Data__c WHERE Account__c =: accountId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
