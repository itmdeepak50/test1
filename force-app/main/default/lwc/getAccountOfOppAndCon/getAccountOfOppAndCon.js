import { LightningElement } from 'lwc';
import data  from'@salesforce/apex/Accountdata.data';
import  getContactAndOpportunity from'@salesforce/apex/Accountdata.getContactAndOpportunity';
export default class GetAccountOfOppAndCon extends LightningElement {


options;
value;
options1;
options2;
connectedCallback(){
data().then(result => {


    var value1 =[];
    for(var name in result){

        value1.push({ label:result[name].Name ,value:result[name].Id })
        console.log(result[name].Name);
    }
    this.options= value1;
    console.log(JSON.stringify(result));
})
}   

handleChange(event){

getContactAndOpportunity({
    accid:event.target.value
    }).then(result=>{
        
        var contact=[];
        var opportunity=[];
        for(var conVsopp in result.contactList){
            contact.push({label:result.contactList[conVsopp].LastName, value:result.contactList[conVsopp].Id})

        }
        this.options1=contact; 
        //console.log("values are   "+JSON.stringify( result.contactList));
        for(var conVsopp in result.opportunityList){
        opportunity.push({label:result.opportunityList[conVsopp].Name,value:result.opportunityList[conVsopp].Id})
        console.log("this is awosome opp "+result.opportunityList[conVsopp].Name)
    }  
    this.options2=opportunity;
        //console.log("values are   "+JSON.stringify( result.opportunityList));

    })
console.log("that is Id   "+event.target.value);
}

}