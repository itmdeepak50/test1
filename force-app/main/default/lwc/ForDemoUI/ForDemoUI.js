import { LightningElement } from 'lwc';
import main from '@salesforce/apex/TestingBluelivApi.main';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ForDemoUI extends LightningElement {


Username;
Password;
buttonVariant = 'brand';

handleClick1(event){
   console.log('username '+event.target.value);
   this.Username = event.target.value;
}

handleClick2(event){
    console.log('password '+event.target.value);
    this.Password = event.target.value;
}

handleClick3(event){
    console.log('ButtonClicked');
    main({
        ApiKey:this.Username
    })
    .then(res=>{
        console.log( 'res '+ res);
    
    if(res=='Successfully AUthenticated')
    {
     this.buttonVariant='success';
     this.ShowToastEvent('success','Successfully Authenticated');
    }
    else{
        this.ShowToastEvent('warning','something went wrong');
    }
})
}

ShowToastEvent(ToastVariant,Message){
    const event = new ShowToastEvent({
        variant:ToastVariant,
        message:Message
    });
    this.dispatchEvent(event);
}


}