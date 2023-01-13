({
	doInit : function(component, event, helper) {
		 component.set("v.truthy1",true);
         component.set("v.truthy2",false);
	},
    Reset:function(component, event, helper){
        
        
        
        helper.resetpassword(component, event, helper);
        
        
    },
    ResetPassword:function(component, event, helper){
         helper.setPassword(component, event, helper);
        
        
    },
    anotherWay: function(component, event, helper){
          component.set("v.truthy1",false);
          component.set("v.truthy4",true);
          console.log("hiii you are stupid");
    },
    sendMail:function(component, event, helper){
        helper.sendemailtomobile(component, event, helper);
    }, 
    
    chkeOtp:function(component, event, helper){
        helper.chek(component, event, helper);
    }
    
    
    
    
    
})