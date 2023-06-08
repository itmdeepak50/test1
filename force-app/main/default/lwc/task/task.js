import { LightningElement,track,wire,api } from 'lwc';
import chekData from '@salesforce/apex/chekDataareExist.chekData';
import saveData from '@salesforce/apex/chekDataareExist.saveData';
import saveData1 from '@salesforce/apex/chekDataareExist.saveData1';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';



export default class Task extends LightningElement {


 // calling values   
 @track contactname;

 // randers values  
 @track AccountName;
 @track fname;
 @track Phone;
 @track email;
 @api value;

 @api Phone ;
 @api Email;
 @api Fname;
 @api AcName;
 @api conlastname;
 @api Exid;

 timeout = null;


// LMS SRVICE  //




@api getdataformParent(namestr){

this.conlastname=namestr.getlastname;
this.Phone=namestr.getphone;
this.Email=namestr.getEmail;
this.Fname=namestr.getFname;
this.AcName=namestr.getacname;
this.Exid=namestr.getExid;




console.log('valu are from parent 123131312 ',this.Phone)
console.log('valu are from parent 123131312 ',this.Email)
console.log('valu are from parent 123131312 ',this.Fname)
console.log('valu are from parent 123131312 ',this.AcName)
console.log('valu are from parent 123131312 ',this.Exid)




}

chek1(event){

this.fname=event.target.value;
console.log('fname value are here ', this.fname);

}


handleClick(){
    
    chekData({

        acname:this.AcName
    }).then(res=>{

        if(res){
         console.log('boollkfsf ',res)
         console.log('hiii if block')
         this.savewithlookAccount(res);
        
           

        }else{

        console.log('hiii else block')
        this.savewithAccount();

              
        }

    }) 


}

savewithlookAccount(res){
  if(this.conlastname!=null && this.AcName!=null){

saveData({
acid:res,
conlname:this.conlastname,
conphone:this.Phone,
email:this.Email,
exid:this.Exid

}).then(result=>{

  if(result){
      console.log('ALL RIGHT');
      this.showToast();
  }else{
      console.log('SOMeTHING WENT WRONG')
  }

})
  }else{
    alert('!!Please select Last Name and Account Name')

  }
}

savewithAccount(res){
    if(this.conlastname!=null && this.AcName!=null){
    saveData1({
    acname:this.AcName,
    conlname:this.conlastname,
    conphone:this.Phone,
    email:this.Email,
    exid:this.Exid
    
    }).then(result=>{
    
      if(result){
          console.log('ALL RIGHT');
          this.showToast();
      }else{
          console.log('SOMeTHING WENT WRONG')
      }
    
    }).catch(console.error())
    
    }else{
alert('!Please select Last Name and Account Name')
    }


    }
    
    showToast() {
        this.refreshvalues();
       

        console.log('hii youe function was trigged');
        const event = new ShowToastEvent({
            title: 'Toast message',
            message: 'Toast Message',
            variant: 'success',
          
        });
        console.log('hii youe function was trigged');
        this.dispatchEvent(event);
    }

handle(){
    console.log('92836498326432jdfsa876r876r');
}


refreshvalues(){
this.Fname=null;
this.Phone=null;
this.Email=null;
this.AcName=null;


}



}