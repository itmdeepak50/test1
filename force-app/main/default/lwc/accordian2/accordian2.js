import { LightningElement,track } from 'lwc';
import getRecords from '@salesforce/apex/Accordian.getRecords'


export default class Accordian2 extends LightningElement {

name;
@track data
@track accd;
@track passcode;
@track activeSections2;
@track activeSections3;
set(event){
    this.name=event.target.value  
   } 
submitDetails(){
    sessionStorage.setItem('acc1', this.name);
    getRecords({
        s:this.name
    }).then(res=>{

        var accounts=[]
        var contacts=[]
        for(var i in res.users[0].acc){
            var ad = res.users[0].acc[i]

            contacts= res.users[0].acc[i].con
        
        /*for (var j in res.users[0].acc[i].con){
            var cd = res.users[0].acc[i].con[j];
            contacts.push({name : cd.name,id:j})
          
        }*/
        accounts.push({name:ad.name, id:i, conn:contacts})
        }
        
        this.accd = accounts;
        console.log('value are from',this.accd[1].conn)

    })

}

handleToggleSection2(event){
    sessionStorage.setItem('acc2' , event.detail.openSections)
    }



    handleToggleSection3(event){
       
       sessionStorage.setItem('acc3' ,event.detail.openSections)

    }


connectedCallback(){
     console.log('hii i aml calll')
    let value1=sessionStorage.getItem('acc1');
    let opvalue3=[];
    let opvalue4=[];
     if(sessionStorage.getItem('acc2')!=null){
     console.log('value are => ', sessionStorage.getItem('acc2'))
     opvalue3=sessionStorage.getItem('acc2').split(',');
     }


     if(sessionStorage.getItem('acc3')!=null){
         opvalue4=sessionStorage.getItem('acc3').split(',');

     }
     console.log('local storage value ar ', value1 )
     this.passcode=value1
     this.name=value1
     console.log('value are ',this.name)
     this.submitDetails()
     this.activeSections2=opvalue3;
     this.activeSections3=opvalue4;

}






}