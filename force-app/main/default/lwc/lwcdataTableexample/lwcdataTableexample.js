import { LightningElement,track } from 'lwc';
import data from '@salesforce/apex/Accountdata.data';

export default class LwcdataTableexample extends LightningElement {


    data;
    
    columns=[

    { label: 'Name', fieldName: 'Name' }
    
    ];
     
    connectedCallback(){
         data().then(result=>{
          console.log("result is  "+ result[0].Name);
          this.data=result;
          console.log("result is this.data  "+ this.data);
        
          
          //this.data=value;
          
         })
     }

}