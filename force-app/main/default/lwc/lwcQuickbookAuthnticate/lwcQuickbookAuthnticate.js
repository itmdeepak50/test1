import { LightningElement ,wire,track,api} from 'lwc';
import getAuthcode from '@salesforce/apex/lwcQuickbookIntegration.getAuthcode'
import { NavigationMixin } from 'lightning/navigation';
import getAccessToken from '@salesforce/apex/lwcQuickbookIntegration.getAccessToken'
import main from '@salesforce/apex/getDatafromQuickbook.main'

import  {CurrentPageReference} from 'lightning/navigation'
export default class LwcQuickbookAuthnticate extends NavigationMixin(LightningElement) {
 data;
@track totalRecord; 
@track columns;
@track clientId;
@track clientSecret;
@track isModalOpen = false;
@track clientIdError
@track clientSecretError
@track obData;

// page rander //
@track isfirstpage=true;
@track isAuthnticatePage =false;
@track parentQuickBook=false;
@api  statusfromqr;
@track value1;


////// end ///////




if(statusfromqr){
    value1 =true;
}



value = '';

  get options() {
     return [
          { label: 'Account', value: 'Account' },
          { label: 'Bill', value: 'Bill' },
          { label: 'CompanyInfo', value: 'CompanyInfo' },
          { label: 'InventoryValuationSummary', value: 'InventoryValuationSummary' },
          { label: 'Invoice', value: 'Invoice' },
          { label: 'JournalReport', value: 'JournalReport' },
          { label: 'Preferences', value: 'Preferences' },
          { label: 'Purchase', value: 'Purchase' },
          { label: 'SalesByClassSummary', value: 'SalesByClassSummary' },
          { label: 'SalesByCustomer', value: 'SalesByCustomer' },
          { label: 'SalesByDepartment', value: 'SalesByDepartment' },
          { label: 'SalesByProduct', value: 'SalesByProduct' },
      ];
  }

  getsObject(event) {
      this.value = event.target.value;
      this.obData=event.target.value;
  }
  
  

  insertData(){

     main({

        objectName: this.obData
     }).then(result=>{

           if(result){
               alert('your data successfully inserted/updated');
           }else{
               alert('your data not inserted');
           }


     })

  }


newAccount(){
this.openModal();

}


setClientId(event){
    this.clientId = event.target.value;
}

setclientSecret(event){
    this.clientSecret=event.target.value;
}
setPasscode(event){
this.passcode=event.target.value;
}


handleClick(){
var chek1=false;
var chek2=false;
if( this.clientId==null || this.clientId==''){
    console.log(this.clientId)
    chek1=false;
    this.clientIdError='Please enter a clientID';
    
    
}else{
    console.log(this.clientId)
    chek1=true;
    this.clientIdError='';

}

if(this.clientSecret==null || this.clientSecret==''){
    console.log(this.clientSecret)
    chek2=false;
    this.clientSecretError='Please enter a clientSecret';
    
    
}else{
    console.log(this.clientSecret)
    chek2=true;
    this.clientSecretError='';

}



if(chek1 && chek2){
console.log(this.clientId);

this.openModal();
}

}


submitDetails() {
console.log(this.clientId);
console.log('ghj');
this.isModalOpen = false;

getAuthcode({

    
    passCode:  this.passcode

}).then(result=>{
        
        console.log(result);
        if(result!=null){
            var strWindowFeatures = "location=yes,height=570,width=520,scrollbars=yes,status=yes";
            window.open(result,"_blank",strWindowFeatures);
            //this.isAuthnticatePage=true;
            //this.isfirstpage=false;
           
        }else{
            alert("You are insert wrog Credintial Please chek your crendtial");
        }


})
}

/*navigateToWebPage(){
var value = window.location.href
console.log("value are here you such good developer   :"+value);
var url_string = value;
var url = new URL(url_string);
var c = url.searchParams.get("code");
var realmId=url.searchParams.get("realmId");
console.log("hii you aouthcode is that   :"+c);
console.log("hii you relamid is that   :"+realmId);
console.log("clien ID   "+this.clientId)
console.log("clien secret  "+this.clientSecret)

getAccessToken({

aouthCode:c,
relamid:realmId

}).then(result=>{
console.log("value is here   :"+result);
if(result!='' || result!=null ){
alert("You are successfully Authnticate ")
var id=1234;
window.location.replace(`https://cloudanalogy-5ca-dev-ed.lightning.force.com/lightning/n/QuickBook?id=${id}`);
}else{



}
})

console.log("value are   :"+this.url);

}*/



openModal() {
// to open modal set isModalOpen tarck value as true
this.isModalOpen = true;
}
closeModal() {
// to close modal set isModalOpen tarck value as false
this.isModalOpen = false;
}



createAccount(){
this.parentQuickBook=true;
this.isfirstpage=false;
}


}