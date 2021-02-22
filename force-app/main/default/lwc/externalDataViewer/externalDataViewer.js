import { LightningElement } from 'lwc';
import loadExternalDataByAccount from '@salesforce/apex/LWC_ExternalDataController.loadExternalDataByAccount';

export default class ExternalDataViewer extends LightningElement {
    @api recordId;

    @wire(loadExternalDataByAccount, {accountId: '$recordId'})
    externalDatas;
}