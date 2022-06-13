import { LightningElement } from 'lwc';
import getAccessToken from '@salesforce/apex/lwcQuickbookIntegration.getAccessToken'
export default class AuthnticatePage extends LightningElement {


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
        
        getAccessToken({
        
        aouthCode:c,
        relamid:realmId
        
        }).then(result=>{
        console.log("value is here   :"+result);
        if(result!='' || result!=null ){
        alert("You are successfully Authnticate ")
        window.close();
        var id=1234;
        //window.location.replace(`https://cloudanalogy-5ca-dev-ed.lightning.force.com/lightning/n/QuickBook?id=${id}`);
        }else{
        
        alert('ljdhjflkflkfj');
        }
        })
        
        console.log("value are   :"+this.url);
        
        }
       
}