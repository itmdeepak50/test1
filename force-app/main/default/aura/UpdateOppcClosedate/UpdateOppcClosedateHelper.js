({   
 
	helperUpdate: function(component, event, helper) {
		component.set('v.columns',[
            
            {label: 'Opportunity Id', fieldName: 'Id', type: 'text'},
            {label: 'Opportunity Name', fieldName: 'Name', type: 'text'},
            {label: 'CloseDate', fieldName: 'CloseDate', type: 'date'}
                    ]);

        component.set("v.truthy",true);
        var action=component.get("c.updatecloseDate");
        action.setParams({
            accid : component.find('acid').get('v.value')
        })
        
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                
                var result=response.getReturnValue();
                component.set("v.data",result);
                component.set("v.Closedate", result[0].CloseDate);
                
            }
        });
        $A.enqueueAction(action);
	},
    
    submitdate:function(component ,event,helper){
        component.set("v.truthy",false);
        console.log("hello");
        var CloseDate=component.get("v.Closedate");
        console.log(CloseDate);
        var action=component.get("c.closedate");
        var opid=component.find('acid').get("v.value");
        
        console.log(opid);
        action.setParams({
            
            oppId:opid,
            oppclosedate:component.get("v.Closedate"),
             
        })
         action.setCallback(this,function(responce){
            if(responce.getReturnValue()!=null){
                console.log(responce.getReturnValue());
                console.log(JSON.stringify(responce.getReturnValue()));
                var responseVal = responce.getReturnValue();
                alert("Updated Close Date :" +responseVal.Id+'  '+responseVal.CloseDate);
                
            }
            
        });
      $A.enqueueAction(action); 
    
      
    }
    
     
})