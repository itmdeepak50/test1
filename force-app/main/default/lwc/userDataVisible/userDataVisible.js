import { LightningElement ,track} from 'lwc';
import getRecords from '@salesforce/apex/GetOpportunity.GetOpportunity'

export default class UserDataVisible extends LightningElement {


    @track opportuntiy;
    oppset = false;

    call(){
        this.oppset = true;

       getRecords().then(res=>{
       
          this.opportuntiy = res;
       })


    }




}