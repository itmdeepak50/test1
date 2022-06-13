({
        OTP:null,
        UserId:null,
        stop:true,
        
        
        
        
        
        
        resetpassword : function(component, event, helper) {
            
            var name1= component.get("v.username");
            console.log("javdjadhv   "+name1)
            var scquestion1=component.find('scquestion').get('v.value');
            console.log("javdjadhv   "+scquestion1)
            var scanswer1=component.get("v.scanswer");
            console.log("javdjadhv   "+scanswer1)
            var chek1=false;
            var chek2=false;
            var chek3=false;
            
            if(name1==''|| name1==null){
                component.set("v.usernameError",'Please enter user name');
            }else{
                component.set("v.usernameError",null);
                chek1=true;
            }
            if(scquestion1=="Scquestion__c" || scquestion1==null){
                component.set("v.scquestionError",'Please Select the Sequrity question');
            }else{
                component.set("v.scquestionError",null);
                chek2=true;
            }
            if(scanswer1==''|| scanswer1==null){
                component.set("v.ScanswerError",'Please enter user name');
            }else{
                component.set("v.ScanswerError",null);
                chek3=true;
            }
            
            if(chek1 && chek2 && chek3){
                
                var action=component.get("c.insertData");
                console.log("hii you are in resetpassword block");
                var name= component.get("v.username");
                var scquestion=component.find('scquestion').get('v.value');
                var scanswer=component.get("v.scanswer");
                console.log("hii value is   "+scquestion);
                console.log("hii value is   "+scanswer);
                
                console.log("hii value is   "+name);
                
                
                action.setParams({
                    userName:component.get("v.username"),
                    scquestion:component.find('scquestion').get('v.value'),
                    scanswer:component.get("v.scanswer")
                    
                })
                console.log("duyddlkajulkd saoidud");
                action.setCallback(this,function(response){
                    
                    var scquestion=component.find('scquestion').get('v.value');
                    var scanswer=component.get("v.scanswer");
                    if(response.getReturnValue()!=null){
                        
                        var value=response.getReturnValue();
                        //console.log("return value is : "+value[0].Scanswer__c )
                        // console.log("use ierNams   "+value[0].Id);
                        var name= component.get("v.username");
                        if(value[0]==null){
                            console.log("hey that your    "+value[0]);
                           // alert("Invalid cardtinals") 
                            var toastEvent = $A.get("e.force:showToast");
                            toastEvent.setParams({
                                title : 'Error',
                                message: 'Invalid cardtinals',
                                type: 'error',
                                mode: 'dismissible'
                            });
                            toastEvent.fire();

                            
                        }
                        
                        
                        else{
                            console.log(value[0].Name);
                           // alert("cardtinals matched") 
                             var toastEvent = $A.get("e.force:showToast");
                            toastEvent.setParams({
                                title : 'Success',
                                message: 'cardtinals matched',
                                type: 'success',
                                mode: 'dismissible'
                            });
                            toastEvent.fire();
                            component.set("v.id",value[0].Id);
                            component.set("v.truthy1",false);
                            component.set("v.truthy2",true);  
                            
                        }
                    }
                    
                });
                
                $A.enqueueAction(action);
            }
            
        },
        
        setPassword:function(component, event, helper){
            var chek1=false;
            var chek2=false;
            
            console.log("hii you are here");
            var pass1=component.get("v.newPassword");
            var pass2=component.get("v.confpassword");
            
            if(pass1==''|| pass1==null){
                component.set("v.pass1Error","Please enter password");
            }else{
                component.set("v.pass1Error",null);
                chek1=true;
                
            }
            
            
            
            if(pass2=='' || pass2==null){
                component.set("v.matchError","Please enter conform password");
            }else if(pass1!=pass2){
                component.set("v.matchError","Password not matched");
            }else{
                component.set("v.matchError",null);
                chek2=true;
            }
            
            
            if(chek1 && chek2){
                
                var action=component.get("c.setpassword");
                action.setParams({
                    userId:component.get("v.id"),
                    password1:component.get("v.newPassword"),
                    password2:component.get("v.confpassword")
                    
                })
                
                action.setCallback(this,function(response){
                    
                    if(response.getReturnValue()!=null){
                        
                        console.log("hii you achive your goal");
                       // alert("you are successfully update your password");
                         var toastEvent = $A.get("e.force:showToast");
                            toastEvent.setParams({
                                title : 'Success',
                                message: 'you are successfully update your password',
                                type: 'success',
                                mode: 'dismissible'
                            });
                            toastEvent.fire();
                        
                        
                        
                        component.set("v.truthy2",false);
                        component.set("v.truthy3",true);  
                        
                        
                    }
                    
                    
                    
                    
                });
                $A.enqueueAction(action);
                window.location.reload();
                
            }
            
        },
        
        
        sendemailtomobile:function(component, event, helper){
            
            //var Stop=component.find('stop').get('v.value');
            var email=component.get("v.email");
            var chek1=false;
            
            if(email==''|| email==null){
                component.set("v.emailError","Please enter the email");
            }else{
                
                component.set("v.emailError",null);
                chek1=true;            
            }
            
            if(chek1){
                
                var otp=Math.floor(100000 + Math.random() * 900000);
                this.OTP=otp;
                console.log(otp);
                var email=component.get("v.email");
                console.log(email);
                
                console.log("ha ha ha");
                
                var action = component.get("c.sendEmail");
                console.log("ha ha ha");
                
                action.setParams({
                    email:component.get("v.email"),
                    otp:otp
                    
                    
                })
                action.setCallback(this,function(response){
                    if(response.getReturnValue()!=null){
                        
                        console.log("you are such  good Developer");
                        var userid=response.getReturnValue();
                        this.UserId=userid.Id;
                        component.set("v.truthy5",true);
                        component.set("v.truthy4",false);
                        
                    }else{
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                        title : 'Error',
                        message: 'you are not registred!!!',
                        type: 'error',
                        mode: 'dismissible'
                    });
                    toastEvent.fire();
    
                    }
                    
                    
                    
                    
                });
                $A.enqueueAction(action);
            }
            
            
        },
        
        
        chek:function(component, event, helper){
            
            var clientOtp=component.get('v.otp');
            var chek1=false;
            if(clientOtp=='' || clientOtp==null){
                component.set("v.otpError","Please enter the otp")
            }else{
                component.set("v.otpError",null);
                chek1=true;
            }
            
            if(chek1){
                
                component.set("V.Data",false);
                console.log("Inside check:: "+component.get("v.Data"));
                var clientOtp=component.get('v.otp');
                var serverOtp=this.OTP;
                var s = serverOtp.toString();
                console.log(s);
                if(clientOtp==s){
                   
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Success',
                        message: 'successfully matched',
                        type: 'success',
                        mode: 'dismissible'
                    });
                    toastEvent.fire();
                    
                    this.stop=false;
                    component.set("v.id" ,this.UserId);
                    component.set("v.truthy5",false);
                    component.set("v.truthy2",true);
                    
                }else{
                     var toastEvent = $A.get("e.force:showToast");
                       toastEvent.setParams({
                        title : 'error',
                        message: 'You are not Registred',
                        type: 'Error',
                        mode: 'dismissible'
                    });
                    toastEvent.fire();
    
                }
            }
            
        },
        
        
        
        
        
        
    })