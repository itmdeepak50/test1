({
    firstPageValidation : function(component, event, helper) {
        var isValidate = true;
        var chek1 = false;
        var chek2=false;
        var chek3=false;
        var chek4=false;
        var chek5=false;
       
        
        
        
               
        
        
        console.log("you are exit to call back function");
 
        
        var name=component.get("v.sObjuser.Name__c");
        var username=component.get("v.sObjuser.Name")
        var password=component.get("v.sObjuser.Password__c");
        console.log("!!!!!That is your Problam in gender");
        
        var gender=component.find('gender');
        gender =Array.isArray(gender) ? gender[0].get("v.value") : gender.get("v.value");
        component.set("v.value" ,gender);
        
        console.log("hey this is gender your "+ gender);
        
        var dateofbirth=component.get("v.sObjuser.Date__c");    
        
        
        
        ////////name validation///////////   
        var nameRex= new RegExp('[A-Z a-z]+$');
        if(name=='' || name==null){
            
            component.set("v.nameError","Please enter the name");
            isValidate=true;
            
            
        }else if(!nameRex.test(name)){
            
            component.set("v.nameError",'Please enter vaild name');
            isValidate=true; 
            console.log("name");
        }
            else{
                
                component.set("v.nameError",null);
                chek1=true;
                
                
            }
        
        /////username validation//////
        var usernameRex= new RegExp('^[a-zA-Z 0-9](_(?!(\.|_))|\.(?!(_|\.))|[a-zA-Z 0-9]){4,18}[a-zA-Z 0-9]$');
        if(username=='' || username==null){
            component.set("v.usernameError",'Please enter the username');
            isValidate=true; 
            
        }else if(!usernameRex.test(username)){
            component.set("v.usernameError",'Please enter the vaild username');
            isValidate=true; 
        }else{
            
            component.set("v.usernameError",null);
            chek2=true;
            
        }
        
        ////// password validation ////////////        
        var passwordRex= new RegExp('^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
        if(password=='' || password==null){
            component.set("v.passwordError",'Please enter the password');
            isValidate=true; 
            
        }else if(!passwordRex.test(password)){
            component.set("v.passwordError",'Please enter the vaild password');
            isValidate=true; 
        }else{
            
            component.set("v.passwordError",null);
            chek3=true;
            
        }
        
        
        
        
        
        /////// Gender validation //////
        
        if(gender=='Gender__c'){
            
            component.set("v.genderError", 'Please select gender');
            isValidate=true; 
            
            
        }else{
            component.set("v.genderError",'');
            chek4=true;
            
        }
        
        
        
        //////date validation//////
        if (dateofbirth==''|| dateofbirth==null){
            component.set("v.dateofbirthError",'Please select the Date of Birth');
            isValidate=true; 
            
        }else{
            component.set("v.dateofbirthError",null);
            chek5=true; 
        }
        
        
        
        console.log("chek value is 1 "+chek1);
        console.log("chek value is 2 "+chek2);
        console.log("chek value is 3 "+chek3);
        console.log("chek value is 4 "+chek4);
        console.log("chek value is 5 "+chek5);
       
        
        
        
        
        
        if(chek1 && chek2 && chek3 && chek4 && chek5){
        var action=component.get("c.chekUserName");
        var uname=component.get("v.sObjuser.Name"); 
        
        action.setParams({
            username:uname
            
        })
        action.setCallback(this,function(response){
            
            var uname=component.get("v.sObjuser.Name"); 
            console.log(uname);
            if(response.getReturnValue()!=''){
                var returnname=response.getReturnValue(); 
                console.log("inside the block");
                console.log(" hii this is return value  "+returnname[0].Name);    
                if(uname==returnname[0].Name){
                    console.log("inside the block");
                    alert("user name alredy Exist");
                    isValidate = true;
                }
                
                
            }else{
                console.log("!!!! nothing to be return");
              //  console.log("chek value is  "+chek6);
                  
              component.set("v.truthy2", true);
              component.set("v.truthy1", false);  
            
            }
        });  
        
        $A.enqueueAction(action); 

                   
        }
        
        
        
        
        
        if(isValidate) {
            
            component.set("v.truthy2", false);
            component.set("v.truthy1", true);  
            
        } 
        
        
    },
    
    ////////////////////////// second page validation //////////////////////////////////////
    secondPageValidation: function(component, event, helper){
        var isValidate=true;
        var chek1 = false;
        var chek2 = false;
        var chek3 = false;
        var chek4 = false;
        
        var addressline1 = component.get("v.sObjuser.AddressLine1__c");
        var addressline2 = component.get("v.sObjuser.AddressLine2__c");
        var zipcode= component.get("v.sObjuser.zipcode__c");
        console.log("!!!!!That is your Problam")
        var country = component.find('country');
        country  =Array.isArray(country) ? country[0].get("v.value") : country.get("v.value");
        console.log("!!!!!That is your Problam 1"    + country );
        component.set("v.value" ,country);
        
        ///////// addressline 1 validation//////////////////
        var adressRex= new RegExp('^[a-z A-Z]{15,}');        
        if(addressline1==''|| addressline1==null){
            component.set("v.address1Error",'Please Enter the Address 1');
            isValidate=true;
        }else if(!adressRex.test(addressline1)){
            
            component.set("v.address1Error",'Please Enter the vaild Address 1');
            isValidate=true;           
        }
        
            else {
                component.set("v.address1Error",null);
                chek1 = true;
            }
        
        
        
        ///////// addressline 2 validation//////////////////
        var adressRex1= new RegExp('^[a-z A-Z]{15,}');        
        if(addressline2==''|| addressline2==null){
            component.set("v.address2Error",'Please Enter the Address 2');
            isValidate=true;
            
        }else if(!adressRex1.test(addressline2)){
            
            component.set("v.address2Error",'Please Enter the vaild Address 2');
            isValidate=true;           
        }
        
            else {
                component.set("v.address2Error",null);
                chek2 = true;
            }
        
        
        
        ////////// zip code validation////////
        
        
        var zipRex= new RegExp('^[1-9][0-9]{5}$');        
        if(zipcode==''|| zipcode==null){
            component.set("v.zipcodeError",'Please Enter the zip code');
            isValidate=true;
            
        }else if(!zipRex.test(zipcode)){
            
            component.set("v.zipcodeError",'Please Enter the vaild zip code');
            isValidate=true;           
        }
        
            else {
                component.set("v.zipcodeError",null);
                chek3 = true;
            }
        
        ////////// zip code validation////////
        
        
        if(country=='country__c'|| country==null){
            component.set("v.countryError",'Please Select the country');
            isValidate=true;
            
        }
        
        else {
            component.set("v.countryError",null);
            chek4 = true;
        }
        
        
        
        if(chek1 && chek2 && chek3 && chek4){
            
            isValidate=false;            
        }
        
        
        
        
        
        if(isValidate) {
            
            component.set("v.truthy3", false);
            component.set("v.truthy2", true);  
            
        }         
        
        
        
        
    },
    
    
    thirdPageValidation:function(component, event, helper){
        var isValidate=true;
        var chek1 = false;
        var chek2 = false;
        var chek3 = false;
        var chek4 = false;
        var contactemail =component.get("v.sObjuser.ContactEmail__c");
        var contactnumber =component.get("v.sObjuser.Contactnumber__c");
        var scquestion = component.find('scquestion');
        scquestion  =Array.isArray(scquestion) ? scquestion[0].get("v.value") : scquestion.get("v.value");
        console.log("!!!!!That is your Problam 1"    + scquestion );
        component.set("v.value" ,scquestion);
        
        var scanswer =component.get("v.sObjuser.Scanswer__c");
        
        var emailRex= new RegExp('^(.+)@(.+)$');         
        if(contactemail=='' || contactemail==null){
            
            component.set("v.conemailError","Please enter the Email");
            isValidate=true;
            
        }else if(!emailRex.test(contactemail)) {
            component.set("v.conemailError","Please enter the valid email");
            isValidate=true;
        }else{
            component.set("v.conemailError",null);
            chek1=true;
        }
        
        
        var conRex= new RegExp('^[7-9][0-9]{9}$');         
        if(contactnumber=='' || contactnumber==null){
            
            component.set("v.conNumberError","Please enter the number");
            isValidate=true;
            
        }else if(!conRex.test(contactnumber)) {
            component.set("v.conNumberError","Please enter the valid number");
            isValidate=true;
        }else{
            component.set("v.conNumberError",null);
            chek2=true;
        }
        
        if(scquestion=='Scquestion__c' || scquestion==null){
            component.set("v.seqError","Please select the sequrity question");
            isValidate=true;
            
        }else{
            component.set("v.seqError",null);
            chek3=true;
        }
        
        var ansRex= new RegExp('^[a-z A-Z]{4,}');        
        if(scanswer=='' || scanswer==null){
            component.set("v.answerError","Please select the sequrity answer");
            isValidate=true;
            
        }else if(!ansRex.test(scanswer)){
            component.set("v.answerError","Please enter valid answer");
            isValidate=true;
        }else{
            component.set("v.answerError",null);
            chek4=true;
        }
        
        
        
        
        
        
        
        if(chek1 && chek2 && chek3 && chek4){
            
            isValidate=false;            
        }
        
        
        
        
        
        if(isValidate) {
            
            component.set("v.truthy3", true);
            
        }else{
            var action =component.get("c.registerUser");
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
            
            
            $A.enqueueAction(action);
            window.location.reload();
        }         
        
        
        
    }   
    
    
    
    
    
    
    
    
    
})