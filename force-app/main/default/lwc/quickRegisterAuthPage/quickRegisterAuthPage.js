import { LightningElement, track } from 'lwc';
import getAccessToken from '@salesforce/apex/lwcQuickbookIntegration.getAccessToken'
import setAouthcode from '@salesforce/apex/insertQuickBookDetail.setAouthcode'


export default class QuickRegisterAuthPage extends LightningElement {


    @track parentQuickBook1=false;
    @track value;

connectedCallback(){

    var value = window.location.href
    console.log("value are here you such good developer   :"+value);
    var url_string = value;
    var url = new URL(url_string);
    var c = url.searchParams.get("code");
    var realmId=url.searchParams.get("realmId");
    console.log("hii you aouthcode is that   :"+c);
    console.log("hii you relamid is that   : "+realmId);
    console.log("clien ID   "+this.clientId)
    console.log("clien secret  "+this.clientSecret)
    if(c!=null){
       
    
      setAouthcode({
        Ocode : c
      }).then(res=>{

       if(res!=null){
         alert('hello can you here me kife is long ');
         window.close();
       }else{
        alert('!!!!!Please enter corroect outh code');
       }

      })
    
    }else{
              
      
    }
    
}

}