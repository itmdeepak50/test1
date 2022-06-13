({
    doInit : function(component, event, helper) {
        var action=component.get("c.getAccdata");
        
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
                
                component.set("v.accountList",response.getReturnValue());
                console.log(JSON.stringify(response.getReturnValue()));
                
            }
            
        });
        $A.enqueueAction(action);
    },
    
    submitData:function(component, event, helper){
        var chek;
        var val1=component.get("v.LastName");
        var val2=component.find('select').get('v.value');
        console.log("pagal hai kya    "+val2);
        
        if(val1==null && (val2==null || val2=='')){
            
             alert("!!!Please Choose Account and Enter the LastName");
             chek=false;
            
        }else if(val2==''){
              console.log("fsjgf"+val1);
             alert("!!!Please Choose the Account");
             chek=false;
            
        }else if(val1==null){
            
            alert("!!!Please Enter the Last Name");
            chek=false;
        }else if(val1=='' && (val2==null || val2=='') ){
            console.log("okkkk");
        }
           
       
        
        if(chek){
        var action=component.get("c.insertconData");
        console.log("hii");
        var value =component.find('select').get('v.value');
        
        console.log(value);
        
        action.setParams({
            accId:component.find('select').get('v.value'),
            lastName:component.get("v.LastName")
        })
        
          console.log(value);
           action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
            var value=response.getReturnValue();
            console.log(JSON.stringify(response.getReturnValue()));
            //alert("Your Contact successfully inserted  "+value.LastName+'     '+value.AccountId);
        
            }
            });
        $A.enqueueAction(action);
        
        }
    }
    
    
    
})