({
	doInit : function(component, event, helper) {
		
        var action = component.get("c.getCountriesCode");
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                console.log('value are',response.getReturnValue());
                var result=response.getReturnValue();
                var value=[];
                for(var name in result){
                    value.push({Id:name, Name:result[name]})
                }
                console.log('value here',value);
                component.set("v.code1",value);
                component.set("v.code2",value add);

                
            }else{
                console.log("nothing to show again");
            }
        });
        $A.enqueueAction(action);
    
	},
    
    convert:function(component, event, helper){
        var action=component.get("c.getCuntriesName");
        console.log(component.find("code1").get("v.value"));
        console.log(component.find("code2").get("v.value"));
        console.log(component.get("v.amount"));
        console.log(component.get("v.apikey"));
        
        
        action.setParams({
            code1:component.find("code1").get("v.value"),
            code2:component.find("code2").get("v.value"),
            amount:component.get("v.amount"),
            apikey:component.get("v.apikey")
            
        })
        
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                component.set("v.apiError",null);
                console.log(JSON.stringify(response.getReturnValue()));
                component.set("v.ConvertedValue",response.getReturnValue());
                console.log("value are not visible   "+response.getReturnValue())
            }else{
                
                component.set("v.apiError","Your Api key is Expeierd please enter Updated Key below Section");
                console.log("chnages for check it's sync with the Azure repo");
            } 
            
            
        });
        
   $A.enqueueAction(action);        
        
    }
    
})