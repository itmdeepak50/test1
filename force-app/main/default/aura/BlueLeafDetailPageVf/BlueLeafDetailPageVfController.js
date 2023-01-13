({
    
    /*doInit : function(component, event, helper){
        
        component.set(component.get("v.RecordId"),v.RecordId);
        console.log('IndoInitRecordId '+RecordId);
        
    },*/
    
    YesButtonCalled : function(component, event, helper){
        console.log('YesButtonCalled')
        var newid = component.get("v.recordId");
       // alert(newid);
      //  alert(component.get('v.recordId'))
        console.log('RecordId '+newid);
        if(newid!=null){
            console.log('newid')
            helper.helperMethod(component,newid);
        }
    },
    
    NoButtonCalled : function(component, event, helper){
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
    }
    
})