import { LightningElement,track,wire,api } from 'lwc';
import getAccountData  from '@salesforce/apex/GetdDatafromexternalOrg.getConData';
import updateAouth  from '@salesforce/apex/getDevOrgAouthCode.getAouthcode';
import { publish, MessageContext } from 'lightning/messageService';
const DELAY = 0;
export default class Exploreaccountlookup extends LightningElement {

@track search = '';
@track error;
@track selectedAccount;
@track showAccountsListFlag = false;
          
accounts;
arr=[];
array=[];
selectedInfo=[];

@track Phone;
@track AcName;
@track Fname;
@track Email;

@api fullValueStr;



connectedCallback(){

    getAccountData().then(result=>{
        const obj = JSON.parse(result);
        console.log(obj);
        for(var i in obj){
    
            console.log(obj[i])
            this.selectedInfo.push(obj[i]);

    
            this.arr.push({Name:obj[i].Name})
        }
    
        }).catch(error=>{
   
        console.log('error aa gyi',error);
        
        this.updateAouthcode();


        })    
    
       console.log('value are array form ',this.arr)
       console.log('value are selected array  form ',this.selectedInfo)
    
    
    }
    
handleKeyUp(event) {

    
    if (!this.showAccountsListFlag) {
        
        this.showAccountsListFlag = true;
        this.template
            .querySelector('.accounts_list')
            .classList.remove('slds-hide');
    }
    window.clearTimeout(this.delayTimeout);
    const searchKey = event.target.value;
    // eslint-disable-next-line @lwc/lwc/no-async-operation
    this.delayTimeout = setTimeout(() => {
        this.search = searchKey;
        console.log('you are such '+this.search)
        var i=0;

    if(this.search!=''){
        if(this.search.length>=3){
            console.log('hiii you are in');
    this.arr.forEach(element => {
        console.log('value are ', this.arr[i].name);
        console.log('elements value are ',element)
      if(element.Name.toLowerCase().startsWith(this.search.toLowerCase())){
            this.array.push({ Name : this.arr[i].Name})
            console.log('you are such',this.arr[i].Name)
            console.log('hey you are close to your result')
      }   
      i++;

    });
}
  }

  console.log('value of array are ',this.array);
  this.accounts=this.array;

  if(this.search){
  this.array=[];
  }



    }, DELAY);
}
handleOptionSelect(event) {
    this.selectedAccount = event.currentTarget.dataset.name;
    this.addselectedinfo();
    this.template.querySelector("c-task").getdataformParent(this.fullValueStr);
   

    console.log('selected value are ',this.selectedAccount)

    this.template
        .querySelector('.selectedOption')
        .classList.remove('slds-hide');
    this.template
        .querySelector('.accounts_list')
        .classList.add('slds-hide');
    this.template
        .querySelector('.slds-combobox__form-element')
        .classList.add('slds-input-has-border_padding');
}
handleRemoveSelectedOption() {
    this.template
        .querySelector('.selectedOption')
        .classList.add('slds-hide');
    this.template
        .querySelector('.slds-combobox__form-element')
        .classList.remove('slds-input-has-border_padding');

    this.showAccountsListFlag = false;
}



addselectedinfo(){
console.log('hii ok you are matched with data ')
for(var i in this.selectedInfo){

  if(this.selectedInfo[i].Name.includes(this.selectedAccount)){
     
     console.log('hii ok you are matched with data ')
      this.fullValueStr = {
        getlastname:this.selectedAccount,  
        getphone:this.selectedInfo[i].Phone,
        getEmail:this.selectedInfo[i].Email,
        getFname:this.selectedInfo[i].Fname,
        getacname:this.selectedInfo[i].Acname,
        getExid:this.selectedInfo[i].Exid
     };


  }

}





}


updateAouthcode(){
console.log('upadte call ')
    updateAouth().then( res=>{

        getAccountData().then(result=>{
            console.log('upadte call 2')

            const obj = JSON.parse(result);
            console.log(obj);
            for(var i in obj){
        
                console.log(obj[i])
                this.selectedInfo.push(obj[i]);

                this.arr.push({Name:obj[i].Name})
            }
        
            })
    })
}

}