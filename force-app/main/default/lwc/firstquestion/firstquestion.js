import { LightningElement } from 'lwc';
import lwcTestAccount from '@salesforce/apex/lwcFirstquestion.lwcTestAccount';
export default class Firstquestion extends LightningElement {

    nameValue;
    phoneValue;
    
      handleChangeName(event){
        console.log('Value return Name:::::::::'+event.target.value);
    this.nameValue = event.target.value;
    console.log('Value return::::::::::  '+this.nameValue);
      }
      handleChangePhone(event){
    this.phoneValue = event.target.value;
    console.log('Value return Phone:::::::::'+this.phoneValue );
      }
    
    
      handleClick(event){
        console.log('NameValue::::::::  '+this.nameValue +'   PhoneValue::::::::  '+this.phoneValue);
        lwcTestAccount({
          name : this.nameValue,
          Phone : this.phoneValue
        }).then(result=>{
          console.log('result:::::::::::::::::::   '+JSON.stringify(result));
        })
      }
    
    }