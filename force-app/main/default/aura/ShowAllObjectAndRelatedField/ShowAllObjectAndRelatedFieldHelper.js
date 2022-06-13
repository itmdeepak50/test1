({
    setobjectName : function(component, event, helper) {
        
        console.log("hii");
        component.set("v.truthy", true);  
        console.log("hii");
        var action =component.get("c.getfields");
        console.log("hii");
        var v=component.find('select').get('v.value');
        console.log(v);
        action.setParams({
            obName : component.find('select').get('v.value')
        })
        
        action.setCallback(this,function(response){
            if(response.getReturnValue!=null){
            component.set("v.fieldList",response.getReturnValue());
            console.log(JSON.stringify(response.getReturnValue()));
            
            }
            
        });
        
        $A.enqueueAction(action);  
	},
    
    getfieldType:function(component, event, helper){
        console.log('hiii');
        component.set("v.truthy1", true);
        var action =component.get("c.getfieldType");
       
        var a=component.find('select').get('v.value');
        var b=component.find('selectfield').get('v.value');
      
        console.log(a+' '+b);
        action.setParams({
            
            obName:component.find('select').get('v.value'),
            fieldName:component.find('selectfield').get('v.value')
        })
        
        action.setCallback(this,function(response){
             if(response.getReturnValue()!=null){
            console.log(JSON.stringify(response.getReturnValue()));
            var s=response.getReturnValue();
            console.log(s);
            component.set("v.Apiname",s[1]);
            component.set("v.fieldname",s[0]);
            
            console.log(b);
             }
        });
  
        $A.enqueueAction(action);  
    }
  
    
})