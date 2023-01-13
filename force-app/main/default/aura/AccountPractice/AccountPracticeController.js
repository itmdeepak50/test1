({
    doInit: function(component, event, helper) {
      
        var action =component.get("c.data");
        
        
        action.setCallback(this,function(responce){
            if(responce.getReturnValue()!=null){
                console.log(responce.getReturnValue());
                console.log(JSON.stringify(responce.getReturnValue()));
                component.set("v.accountList",responce.getReturnValue());
            }
            
        });
       
        $A.enqueueAction(action);
    },
    
    submitData:function(component, event, helper) {
        
        helper.submitAccount(component, event, helper);
        
        
    },
    
    
    getNumbers:function(component, event,helper){
        
        helper.showNumber(component, event,helper);
    }
    
    
    
    
    
    
    
})