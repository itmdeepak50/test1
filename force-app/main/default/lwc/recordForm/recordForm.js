import { LightningElement,track} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
export default class RecordForm extends LightningElement {
    fields = 'Name';

    // Flexipage provides recordId and objectApiName
    @track recordId;
    @track objectApiName='Account';
    }