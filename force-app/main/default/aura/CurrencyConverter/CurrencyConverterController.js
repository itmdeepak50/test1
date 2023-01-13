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
                component.set("v.code2",value);

                
            }else{
                console.log("nothing to sho");
            }
        });
        $A.enqueueAction(action);
    
	},
    
    convert:function(component, event, helper){
        /*var action=component.get("c.getCuntriesName");
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
                console.log("i am in the else block");
            }
            
            
        });
        
   $A.enqueueAction(action); */       
        


       var option =[];
       option = component.get("v.option");
       var code1 =component.find("code1").get("v.value");
       var code2 = component.find("code2").get("v.value");
       let flag = 0;

       for(let i=0;i<option.length;i++){
        if(code1==option[i]['TAG1']&&code2!=option[i]['TAG2']){

           option.splice(i,1);
           console.log('if');
           flag =1;           
           break;

        }
        else if(code1==option[i]['TAG1']&&code2==option[i]['TAG2']){
            console.log('else');
            flag = 1;
            break;
        }

       }

       if(flag == 0){
        option.push({TAG1:code1, TAG2:code2});
       }
       
       component.set("v.option",option);
       
       

      


       console.log('option value is', component.get("v.option"));




    }
    
})