({
	
   /*rerender : function(component, helper) {
   this.superRerender();
       console.log('value of prvious state is :::',document.referrer)
       component.set("v.isModalOpen",true);
       
         var arr = []
          var value = component.get("v.pageReference").state.defaultFieldValues
          
          arr = value.split(',');
          var country = arr[2].split('=')[1];
         
          component.set("v.Country",country);
         
          
       
       
   console.log('Again reload',component.get("v.newvalue"),component.get("v.Country"))
     var idvalue = []
          var accId = component.get("v.pageReference").state.additionalParams
          console.log('REACH THIS POINT');
          console.log('Account ID is ', accId);
          idvalue = accId.split('=');
          var newStr = idvalue[1].replace('&','');
          console.log('value of id is', newStr);
          console.log('reach this stage look into that++')
          console.log('previous url is ++ ', document.referrer);
          
       if(component.get("v.newvalue") == undefined){ 
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
                component.set("v.newvalue",resp);
              }
            else{
                consloe.log('ERROR');
            }
            
        });
        $A.enqueueAction(action);
        
   }
   }*/
    
})