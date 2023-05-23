import { LightningElement,track,api,wire } from 'lwc';
import getDataAccountDataFromBlueLeaf from '@salesforce/apex/GetAccountDatacontroller.getDataAccountDataFromBlueLeaf';
import { getRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CurrentPageReference } from 'lightning/navigation';


export default class BlueleafVfLwc extends LightningElement {

@track isShowModal;
@track changeBarWidth;
@track PbarStatus;
Message;
Apikey = '61c1b6069e26ddffb40c5da130d0171a93a69d24aaba3ca6b897f49e2b89eafc'
iconHidden;
@api recordId;
urlId = null;


@wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
       if (currentPageReference) {
          this.urlId = currentPageReference.state.recordId;
          console.log('kjk====> '+this.urlId)
          console.log('sdasd++>', currentPageReference);
       }
    }

ImportButtonVariant
    connectedCallback(){
        this.isShowModal=true;
        this.changeBarWidth = "0"
        this.ImportButtonVariant = 'brand'
    }

    hideModalBox(){
        this.isShowModal=false;
    }
    

    CallingApexClass(){
        console.log('CallingApexClass');
        this.changeBarWidth = '50'
        getDataAccountDataFromBlueLeaf({
            RecordId : this.urlId
         })
         .then(res=>{
            console.log(res);
            if(res=='Successful')
            {
                this.changeBarWidth = "100"
                 this.iconHidden = true;
                 
            }
            else if(res=='Unsuccessful')
            {
                
                this.Message = 'Something went wrong';
            }
         })
    }

    CancelInsertingRecords(){

    }




}