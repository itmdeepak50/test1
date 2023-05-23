import { LightningElement ,track} from 'lwc';
import getRecords from '@salesforce/apex/GetOpportunity.GetOpportunity'

export default class UserDataVisible extends LightningElement {

values = ['deepak','deepak3','deepak4'];



constructor(){
super();
console.log('LOAD INSIDE THE CONSTRUCTOR')
getRecords({

}).then(res=> {
    if(res){
    console.log('successfully call')
    }else{
        console.log('not successfully call' )

    }
})

}





}