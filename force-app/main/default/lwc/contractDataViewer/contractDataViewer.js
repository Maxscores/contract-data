import { LightningElement, api, wire } from 'lwc';
import loadContractDataByAccount from '@salesforce/apex/LWC_ContractDataController.loadContractDataByAccount';

export default class ContractDataViewer extends LightningElement {
    @api recordId;

    @wire(loadContractDataByAccount, {accountId: '$recordId'})
    contractDatas;
}