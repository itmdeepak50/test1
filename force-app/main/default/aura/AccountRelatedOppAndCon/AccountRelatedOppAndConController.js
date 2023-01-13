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
    
    getConAndOppRelatedAcc:function(component, event, helper){
        component.set("v.truthy",true);
        var action=component.get("c.getContactAndOpportunity");
        
        action.setParams({
            accid : component.find('acid').get('v.value')
        })
        
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                component.set("v.conList",response.getReturnValue().contactList);
                component.set("v.oppList",response.getReturnValue().opportunityList);
                console.log(response.getReturnValue().isTrue);
            } 
        
        });
     
        $A.enqueueAction(action);
        
    }
    
})