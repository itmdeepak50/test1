import { LightningElement,track } from 'lwc';
import main2 from '@salesforce/apex/TestingBluelivApi.main2';
export default class BlueleafVfLwc extends LightningElement {

@track isShowModal;
@track changeBarWidth;
@track PbarStatus;
Message;
Apikey = '61c1b6069e26ddffb40c5da130d0171a93a69d24aaba3ca6b897f49e2b89eafc'
iconHidden;
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
         main2({
            ApiKey : this.Apikey
         })
         .then(res=>{
            console.log(res);
            if(res=='Successfully Authenticated')
            {
                this.changeBarWidth = "100"
                 this.iconHidden = true;
                 this.ImportButtonVariant = 'success'
                  this.Message = 'Households Imported Successfully';
            }
         })
    }

    CancelInsertingRecords(){

    }
}