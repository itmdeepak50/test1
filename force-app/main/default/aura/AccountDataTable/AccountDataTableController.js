({
    doInit : function(component, event, helper) {
        console.log("hii");
        
        
        component.set('v.columns',[
            
            {label: 'Account Name', fieldName: 'Name',sortable:true, type: 'text'},
            {label: 'Phone Number', fieldName: 'Phone', sortable:true,type: 'Phone'},
            {label: 'Account Site', fieldName: 'Site', sortable:true,type: 'text'}
        ]);
        console.log("hii");
        
        var action =component.get("c.getAccountData");
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                console.log();
                console.log(JSON.stringify(response.getReturnValue()));
                var result=response.getReturnValue();
                component.set("v.data",result);
                
            }
            
        });
        $A.enqueueAction(action);
    },
    
    updateSorting: function (cmp, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
    },
    
    
})