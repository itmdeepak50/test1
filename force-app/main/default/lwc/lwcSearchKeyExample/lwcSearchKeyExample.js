import { LightningElement, track,wire} from 'lwc';
 import getAccountData from'@salesforce/apex/lwcSearchAccount.getAccountData';
 export default class LwcSearchKeyExample extends LightningElement {

  SearchKey;
  accounts;
  getaccount;
  name;

  arr=[];
  
  array=[];

connectedCallback(){

  getAccountData().then(result=>{


      for(var i in result){

        console.log(result[i].Name)

         this.arr.push({Name:result[i].Name})
      }

       //this.arr.push(result);
      // console.log("result is  "+ result);
       

   })    

   console.log('value are array form ',this.arr)

}



  handleKeyChange(event){


    this.Serachkey= event.target.value;
    var i=0;

   

    if(this.Serachkey!=''){
    this.arr.forEach(element => {
        console.log('value are ', this.arr[i].name);
        console.log('elements value are ',element)
      if(element.Name.toLowerCase().includes(this.Serachkey.toLowerCase())){
            this.array.push({ Name : this.arr[i].Name})
            console.log('you are such',this.arr[i].Name)
            console.log('hey you are close to your result')
      }   
      i++;

    });
  }

  console.log('value of array are ',this.array);
  this.accounts=this.array;

  if(this.Serachkey){
  this.array=[];
  }



  /*console.log(" hey that is    "+event.target.value)
  var val =event.target.value
  if(val!=null){
    getAccountData({
      accname:event.target.value
     }).then(result=>{
  
  
         this.accounts=result;
         console.log("result is  "+ result);
  
     })    
  }*/
  
  }

  optionsClickHandler(event){
     this.name=event.target.key;
   

       if(event.target.value){
        console.log('hii value are pta hai',event.target.value);
       }else{
        console.log('hii value are else block',event.target.value);
       }


  }





 }