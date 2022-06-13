import { LightningElement,track,api } from 'lwc';
import setQuickBookData from '@salesforce/apex/insertQuickBookDetail.setQuickBookData';
import getRegisterNewUser from '@salesforce/apex/lwcQuickbookIntegration.getRegisterNewUser';


export default class ParentQuickBook extends LightningElement {

@track indecator=true;
@track registerPage=true;
@track step='1';
@track userName;
@track clientId;
@track clientSecret;
@track reelamId;
@track passcode;
@track Authnticatebutton = false;
@api statusformlwc; 
@track result;
@track windowRef;
@track quickBookData;
@track abc='hrllo';


setuserName(event){

this.userName= event.target.value;
}

setClientId(event){
this.clientId = event.target.value;
}

setclientSecret(event){
this.clientSecret=event.target.value;
}

setreeLamId(event){
this.reelamId=event.target.value;

}
setpassCode(event){
this.passcode=event.target.value;

}
  

saveDetail(){
this.step="1";

this.quickBookData=[this.userName,this.clientId,this.clientSecret,this.reelamId,this.passcode];
getRegisterNewUser({

objData : this.quickBookData

}).then(result=>{

if(result!=null){

   var strWindowFeatures = "location=yes,height=570,width=520,scrollbars=yes,status=yes";
   window.open(result,"_blank",strWindowFeatures)
  
   
}else{
   alert('Please enter valid client Id ')
}

})
console.log('value are:::',quickBookData);

}

SetData(){
   console.log('valkue are '+this.abc); 
   console.log('lkadlsajda::'+this.quickBookData);
   setQuickBookData({
      objData1:this.quickBookData

   }).then(res=>{
      
      if(res!=null){
      this.step="2";
      alert('you are succesfully registred');
      
      }else{
         alert('First verified than after registered ');
      }

   });
}

changeStatus(){
alert('successfully called ');
}

genrateAlert(){
  
}

}