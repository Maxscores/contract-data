@IsTest
public with sharing class LWC_ExternalDataController_Test {
    @TestSetup
    static void makeData(){
        Account testAccount1 = new Account(Name = 'test Account 1');
        Account testAccount2 = new Account(Name = 'test Account 2');
        insert new List<Account>{testAccount1, testAccount2};

        External_Data__c extData1 = new External_Data__c(Account__c = testAccount1.Id);
        External_Data__c extData2 = new External_Data__c(Account__c = testAccount1.Id);
        External_Data__c extData3 = new External_Data__c(Account__c = testAccount1.Id);
        External_Data__c extData4 = new External_Data__c(Account__c = testAccount2.Id);

        insert new List<External_Data__c>{extData1, extData2, extData3, extData4};
    }

    @IsTest
    public static void testLoadsContractData_Success() {
        Account testAccount1 = [SELECT Id From Account WHERE Name = 'test Account 1'];

        Test.startTest();
        List<External_Data__c> extDatas = LWC_ExternalDataController.loadExternalDataByAccount(testAccount1.Id);
        Test.stopTest();

        System.assertEquals(3, extDatas.size());
    }

    @IsTest
    public static void testLoadsContractData_Success_NullInput() {
        Test.startTest();
        List<External_Data__c> extDatas = LWC_ExternalDataController.loadExternalDataByAccount(null);
        Test.stopTest();

        System.assertEquals(0, extDatas.size());
    }
}    
