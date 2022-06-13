import { LightningElement ,wire} from 'lwc';
import  getContactAndOpportunity from'@salesforce/apex/Accountdata.getContactAndOpportunity';
import {
    subscribe,
    unsubscribe,
    APPLICATION_SCOPE,
    MessageContext
  } from "lightning/messageService";
  
  import SAMPLEMC from "@salesforce/messageChannel/SampleMessageChannel__c";
export default class Test12 extends LightningElement {

    @wire(MessageContext)
    messageContext;
  
    subscription = null;
    receivedMessage;
   

    connectedCallback(){
     
     
      this.subscription = subscribe(
        this.messageContext,
        SAMPLEMC,
        message => {
          this.handleMessage(message);
        },
        { scope: APPLICATION_SCOPE }
      );
    
}
  
    unsubscribeMC() {
      unsubscribe(this.subscription);
      this.subscription = null;
      this.isDisabled = false;
      this.isDisabledUnsb = true;
    }
  
    handleMessage(message) {
      this.receivedMessage = message
        ? JSON.stringify(message, null, "\t")
        : "no message payload";
    }
  





}