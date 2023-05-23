({
	doInit : function(component, event, helper) {
        component.set("v.isModalOpen",true);
                 var urls = window.history;
                 console.log('value of prvious state is :::',urls);
          var newStr = '';
                 

          var arr = [];
          //var value = component.get("v.pageReference").state.defaultFieldValues
          
          /*arr = value.split(',');
          var country = arr[2].split('=')[1];
          component.set("v.Country",country);
           var accid = arr[1].split('=')[1];
           var url = window.location.origin + '/lightning/r/Account/'+accid+'/view';
          component.set("v.URL",url);
           console.log(url);           
           console.log('value of url is ',url);
        console.log('ACC ID VALUE IS',accid);*/
        
        
        
       
         
          
        var action=component.get("c.getDetailOfAccount");
        action.setParams({
            accid : newStr
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
                var resp=response.getReturnValue();
                console.log('value of account',resp);
                component.set("v.Country",resp);
              }
            else{
                console.log('ERROR');
            }
            
        });
        $A.enqueueAction(action);
        
        
    },
    closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
     
      component.set("v.isModalOpen", false);
      window.open(component.get("V.URL"),"_self");
   }
 
    
    
})