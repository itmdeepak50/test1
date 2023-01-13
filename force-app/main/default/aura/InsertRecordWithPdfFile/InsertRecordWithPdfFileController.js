({
	doInit : function(component, event, helper) {
		
	},
    
    sendData : function(component,event,helper){
      
     
        //var username = component.get('v.username')
        //console.log(component.get("v.username"))
      //  window.open('https://cloudanalogy-5ca-dev-ed--c.visualforce.com/apex/Testform?username1='+username+'','_self')
        var action=component.get('c.downloadpdf')
        action.setParams({
            accid: component.get("v.recordId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state='SUCCESS'){
                alert('saved succesfully')
                 let quickActionClose = $A.get("e.force:closeQuickAction");
                 quickActionClose.fire();
            }
        
        
        });
            $A.enqueueAction(action);

        /*if(component.get("v.username")){
          console.log('112132133213')
             console.log(component.get("v.username"))
         var myEvent = $A.get("e.c:sendDatafromauratovf");
             console.log('11213213321300000000000')

            myEvent.setParams({
                username: value
            });
            myEvent.fire();
            console.log('112132133213')
    }
    else{
    console.log('odjasodjojdosdijoijdjdo')
}*/
    
        
}  
    
})