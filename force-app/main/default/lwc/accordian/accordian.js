import { LightningElement,track,wire} from 'lwc';
import getRecords from '@salesforce/apex/Accordian.getRecords'


const columns = [
    { label: 'NAME', fieldName: 'nameUrl', type: 'url' , typeAttributes: { label: { fieldName: 'name' }, target: '_blank'}},
    { label: 'Phone', fieldName: 'phone' },
    { label: 'Email', fieldName: 'email' },
    { label: 'Account Name', fieldName: 'accnameurl', type: 'url' , typeAttributes: { label: { fieldName: 'acname' }, target: '_blank'} }
];


export default class Accordian extends LightningElement {
    @track searchKey;
    @track contactData =[];
    @track passcode;
    @track activeSections1;
    @track activeSections2;
    @track activeSections3;



    accd=[];
    no_ofcontact; 
    data=[];
    columns = columns;
    name;
    set(event){
     this.name=event.target.value  
    } 
   submitDetails(){
    sessionStorage.setItem(1, this.name);
        getRecords({
            s:this.name
        }).then(res=>{

        var con=[];
        for(var user in res.users){
           
          console.log('value are =>',res.users[user].acc)
          for(var j in res.users[user].acc){
             for(var k in res.users[user].acc[j].con){

                   console.log('contact are',res.users[user].acc[j].con[k])
                   var condata=res.users[user].acc[j].con[k]
                   var accname=res.users[user].acc[j].name
                   var accnameurl = `/${condata.AccountId}`;
                   let  nameUrl = `/${condata.Id}`;
                   con.push({name:condata.Name,phone:condata.Phone,email:condata.Email,nameUrl:nameUrl,acname:accname,accnameurl:accnameurl})
             }   
          }

        }
       
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

       this.data=con
        }) 
    }

    handleToggleSection(event) {
        console.log( 'Selected Sections ' + event.detail.openSections);
        sessionStorage.setItem(2 , (event.detail.openSections))

    }
    handleToggleSection2(event){
    sessionStorage.setItem(3 , event.detail.openSections)

    }


   connectedCallback(){
  
     let value1=sessionStorage.getItem(1);
     let opvalue2=sessionStorage.getItem(2);
     let opvalue3=[];
     if(sessionStorage.getItem(3)!=null){
     console.log('value are => ', sessionStorage.getItem(3))
     opvalue3=sessionStorage.getItem(3).split(',');
     }


     console.log('local storage value are ', value1 )
     this.passcode=value1
     this.name=value1
     console.log('value are ',this.name)
    this.submitDetails()
    this.activeSections1=opvalue2;
    this.activeSections2=opvalue3;
    console.log(opvalue3)

   }
    

}