({
    doInit : function(component, event, helper) {
        console.log("hello");
        var action =component.get("c.getObjectData");
        console.log("hello");
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                component.set("v.objectList",response.getReturnValue());
                console.log(JSON.stringify(response.getReturnValue()));
                
            }
        });
        
      $A.enqueueAction(action);
    },
    
    
    setName: function(component, event, helper){
        
        helper.setobjectName(component, event, helper);
        
    },
    
    getfield:function(component, event, helper){
        helper.getfieldType(component, event, helper);
    }
        
})