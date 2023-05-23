import { LightningElement ,track} from 'lwc';
import getQueryData from '@salesforce/apex/chatgptclass.getQueryData';

export default class Chatgptchatbot extends LightningElement {
    @track searchResults = [];
    @track searchTerm = '';
    @track showSpace = true ;
    @track showSpinner = false
    @track responseData 
    @track results
    @track userAndRepsonseData =[];
    @track reactive;
    index = 0;
    arr =[];
    i = 0;
    mess = 'Welcome ChatGpt ChatBot Ask Your Any Query'
    
    connectedCallback(){

      //this.userAndRepsonseData.push({you:this.mess});
    }



    handleKeyDown(event) {
        console.log('log outside');
         var searchData ='';
        if (event.keyCode === 13) {
            console.log('log inside');
          // Perform search when the Enter key is pressed
          this.searchTerm = event.target.value;
          searchData = this.searchTerm;
          this.searchTerm ='';
          //this.showSpinner = true
          this.searchResults = [];
          this.reactive = '';
          this.userAndRepsonseData.push({you:'You : '+searchData,isBot:false,id:this.index++});
          console.log('reach here',this.userAndRepsonseData)
          getQueryData({searchString:searchData})
           .then(result=>{
             this.showSpinner = false
             let response = JSON.parse(JSON.stringify(JSON.parse(result)));
             console.log('Result is ', response);
             if (response.error) {
                      this.responseData = response.error.message;
                      this.userAndRepsonseData.push({bot:'Bot : '+this.responseData,isBot:true,id:this.index++});
                      console.log('Here reached status');

              } else if (response.choices[0].text) {
                this.responseData = response.choices[0].text;
                    var i=0;
                    var  arr1 =[]
                      arr1 = this.responseData.split(" ");
                      console.log('Here reached status along');
                      this.myloop1(i,arr1);
                      console.log('response data is', this.responseData);
                      const data = this.responseData;
                      this.userAndRepsonseData.push({bot :'Bot : '+data,isBot:true,id:this.index++});
                      console.log('ARRAY DATA IS ',JSON.stringify(this.userAndRepsonseData,null,2));

                      this.responseData = this.responseData.replace(/\n/g, "<br />");
                      let tempScriptData = ''
                      tempScriptData = (response.choices[0].text.includes('<script>')) ? 'JS File: ' + response.choices[0].text.split('<script>')[1] : '';
                      tempScriptData = this.responseTextLWCJS.replace(/\n/g, "<br />");
                      console.log('HERE REACHED')
                      this.responseData = this.responseData + this.responseTextLWCJS;
                      this.responseData = (this.responseData.includes('XML File:')) ? this.responseData.split('XML File:')[0] : this.responseData;
                      this.responseData.trim();
                      console.log('RESPONSE DATA ', this.responseData);
                      this.userAndRepsonseData.push(this.responseData);
                      console.log('final array',JSON.stringify(this.userAndRepsonseData,null,2));
              }
             console.log('ss',JSON.stringify(responseData))
           })
           .catch(error=>{
             this.showSpinner = false
             console.log('error is '+error)
           })
      
          /*this.searchResults = this.results;
          if(this.searchResults.length > 0 )
            this.showSpace =false*/
        }
      
    }



  myloop1(i,arr){
      var th = this;
      console.log('value of arr is ', arr[i]);
      setTimeout(function() {
      th.reactive+= ' '+arr[i];
      i++;                    
      if (i < arr.length) {           
       th.myloop1(i,arr);
       console.log('it s print ', i  , 'time ')          
      }   
   
    }, 200)                    
  }


}