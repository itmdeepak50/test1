({
    doInit : function(component, event, helper) {
        //component.set("v.truthy3", true);  
        
        component.set("v.truthy1", true);  
        component.set("v.truthy2", false);  
        console.log("hii");
        var s='lfhjfsfjfkjh fsuft';
       // component.set("v.name1",s);
        console.log(s);
        
    },
    
    Page2 :function(component, event, helper) {
        component.set("v.truthy1", false);  
        component.set("v.truthy3", false);  
        component.set("v.truthy2", true);  
        console.log("hii you are back");
        var whichOne = event.getSource().getLocalId();
        console.log("hi this is button     "+ whichOne);
        
        if(whichOne=='button1'){
        helper.firstPageValidation(component, event, helper);
        }
    },
    
    
    Page3 :function(component, event, helper) {
        component.set("v.truthy2", false);  
        component.set("v.truthy3", true);  
        console.log("hii");
        helper.secondPageValidation(component, event, helper);
         
    },
    
     handleChange: function (component, event) {
        // This will contain the string of the "value" attribute of the selected option
        console.log("mai hu jinda");
        //var selectedOptionValue = event.getParam("value");
        //cmp.set('v.sObjuser.Gender__c',selectedOptionValue);
        //console.log(cmp.get('v.sObjuser.Gender__c'));
        var gender=component.find('gender');
        gender =Array.isArray(gender) ? gender[0].get("v.value") : gender.get("v.value");
        component.set("v.value" ,gender);
        component.set('v.sObjuser.Gender__c',gender); 
        
       
        
    },
    
    
     handleChange1: function (component, event) {
        // This will contain the string of the "value" attribute of the selected option
        console.log("mai hu jinda");
         var country = component.find('country');
         country  =Array.isArray(country) ? country[0].get("v.value") : country.get("v.value");
         component.set('v.sObjuser.country__c',country);
    },
    
    
    handleChange2: function (cmp, event) {
        // This will contain the string of the "value" attribute of the selected option
        console.log("mai hu jinda");
        var selectedOptionValue = event.getParam("value");
        cmp.set('v.sObjuser.Scquestion__c',selectedOptionValue);
        console.log(cmp.get('v.sObjuser.Scquestion__c'));
    },
    
    
    submit:function(component, event, helper){
        console.log("!!!this submit Call")
        helper.thirdPageValidation(component, event, helper);
        /*var action =component.get("c.registerUser");
        var acc=component.get("v.sObjuser");
        action.setParams({
            userObject:acc
            
        })
        action.setCallback(this,function(response){
            if(response.getReturnValue()!=null){
            console.log(JSON.stringify(response.getReturnValue()));
            }else{
                console.log("!!!! nothing to be return");
            }
        }) ;  
            
            
        console.log(JSON.stringify(acc)); 
       
        
        $A.enqueueAction(action);*/
    },
    
    togglePassword : function(component, event, helper) {
        if(component.get("v.showpassword",true)){
            component.set("v.showpassword",false);
        }else{
            component.set("v.showpassword",true);
        }
    },checkValidity : function(component, event, helper) {
        var validity = event.getSource().get("v.validity");
        console.log(validity)
    }
    
   
    
})