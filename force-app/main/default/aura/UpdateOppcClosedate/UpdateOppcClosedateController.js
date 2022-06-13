({
	doInit : function(component, event, helper) {
		var action=component.get("c.getoppData");
        
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                
                component.set("v.oppList",response.getReturnValue());
                console.log(JSON.stringify(response.getReturnValue()));
            } 
     
        });
        
        $A.enqueueAction(action)
	},
    
    updateDate:function(component, event, helper){
        
        helper.helperUpdate(component, event, helper);
    },
    
    
    submitData:function(component ,event,helper){
        
        helper.submitdate(component ,event,helper);
    }
    
    
})