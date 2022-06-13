({
    doInit : function(component, event, helper) {
        component.set("v.truthy2",false);
        component.set("v.truthy1",true);
        
        
    },
    
    signIn:function(component, event, helper){
        console.log("helo");
        var chek1=false;
        var chek2=false;
        var userName= component.get("v.username");
        var  userPassword=component.get("v.password");
        
        
        if(userName=='' || userName==null){
            component.set("v.usernameError","Please enter user name");
            
        }else{
            component.set("v.usernameError",null);
            chek1=true;
            
        } 
        
        if(userPassword=='' || userPassword==null){
            component.set("v.passwordError","Please enter password");
            
        }else{
            
            component.set("v.passwordError",null);
            chek2=true;
            
        }
        
        
        if(chek1 && chek2){
            
            var action=component.get("c.getsignField");
            console.log("hii");
            
            action.setParams({
                userName: component.get("v.username"),
                userPassword:component.get("v.password")
            })
            action.setCallback(this,function(response){
                console.log(JSON.stringify(response.getReturnValue()));
                var value=response.getReturnValue();
                var username=component.get("v.username");
                var password=component.get("v.password");
                var chek;
                if(value.Name==username && value.Password__c==password){
                    chek=true; 
                }else{
                    chek=false;
                }
                
                if(chek){
                    //alert("hii :"+username +" you are Succesfully login");
                     var toastEvent = $A.get("e.force:showToast");
                     toastEvent.setParams({
                        title : 'Error',
                        message: 'hii you are successfully login',
                        type: 'success',
                        mode: 'dismissible'
                    });
                    toastEvent.fire();
                }else{
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Error',
                        message: 'Please enter correct user name and Password.',
                        type: 'error',
                        mode: 'dismissible'
                    });
                    toastEvent.fire();
                    // alert("!!!Please Enter correct UserName Or Password");
                }
            });
            
            $A.enqueueAction(action);
            
        }
        
        
        
        /*  var action=component.get("c.getsignField");
         console.log("hii");
           

        action.setParams({
            userName: component.get("v.username"),
            userPassword:component.get("v.password")
        })
        action.setCallback(this,function(response){
            console.log(JSON.stringify(response.getReturnValue()));
            var value=response.getReturnValue();
            var username=component.get("v.username");
            var password=component.get("v.password");
            var chek;
            if(value.Name==username && value.Password__c==password){
               chek=true; 
            }else{
               chek=false;
            }
            
            if(chek){
                alert("hii :"+username +" you are Succesfully login");
            }else{
                alert("!!!Please Enter correct UserName Or Password");
            }
        });
        
        $A.enqueueAction(action);*/
    },
    
    signup:function(component, event, helper){
        component.set("v.truthy1",false);
        component.set("v.truthy2",true);
        
        
    },
    forgetPassword:function(component, event, helper){
        
        component.set("v.truthy1",false);
        component.set("v.truthy3",true);
        
    }
    
    
    
    
})