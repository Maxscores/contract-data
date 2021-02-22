@IsTest
public without sharing class LWC_ContractDataController_Test {
    @TestSetup
    static void makeData(){
        Account testAccount1 = new Account(Name = 'test Account 1');
        Account testAccount2 = new Account(Name = 'test Account 2');
        insert new List<Account>{testAccount1, testAccount2};


        Contract_Data__c contractData1 = new Contract_Data__c(Account__c = testAccount1.Id, Review_Date__c = Date.newInstance(2020, 01, 01));
        Contract_Data__c contractData2 = new Contract_Data__c(Account__c = testAccount1.Id);
        Contract_Data__c contractData3 = new Contract_Data__c(Account__c = testAccount1.Id, Review_Date__c = Date.newInstance(2021, 01, 14));
        Contract_Data__c contractData4 = new Contract_Data__c(Account__c = testAccount2.Id);
        insert new List<Contract_Data__c>{contractData1, contractData2, contractData3, contractData4};
    }

    @IsTest
    public static void testLoadsContractData_Success() {
        Account testAccount1 = [SELECT Id From Account WHERE Name = 'test Account 1'];

        Test.startTest();
        List<Contract_Data__c> contractDatas = LWC_ContractDataController.loadContractDataByAccount(testAccount1.Id);
        Test.stopTest();

        System.assertEquals(3, contractDatas.size());
    }

    @IsTest
    public static void testLoadsContractData_Success_NullInput() {
        Test.startTest();
        List<Contract_Data__c> contractDatas = LWC_ContractDataController.loadContractDataByAccount(null);
        Test.stopTest();

        System.assertEquals(0, contractDatas.size());
    }
}
