import { LightningElement, api, wire } from 'lwc';
import loadContractDataByAccount from '@salesforce/apex/LWC_ContractDataController.loadContractDataByAccount';

export default class ContractDataViewer extends LightningElement {
    @api recordId;

    @wire(loadContractDataByAccount, {accountId: '$recordId'})
    contractDatas;

    
    dataColumns = [
        {
            label: 'Name', 
            fieldName: 'Name',
        },
        {
            label: 'Review Date',
            fieldName: 'Review_Date__c',
            type: 'date',
            typeAttributes:{
                month: 'numeric',
                day: 'numeric',
                year: 'numeric',
            },
        }
    ];
}