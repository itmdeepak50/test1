({
    submitAccount: function(component, event, helper) {
        
        var action=component.get("c.insertAccount");
        
        action.setParams({
            
            accountName:component.get("v.Name"),
            accountPhone:component.get("v.Phone"),
            accountEmployee:component.get("v.Employees"),
            accountAccountNumber:component.get("v.AccountNumber"),
            accountWebsite:component.get("v.Website")
            
            
        })
        
        action.setCallback(this,function(responce){
            if(responce.getReturnValue()!=null){
                console.log(responce.getReturnValue());
                console.log(JSON.stringify(responce.getReturnValue()));
                var responseVal = responce.getReturnValue();
                alert("account parmas:::" +responseVal.Name+'  '+responseVal.Phone+'   '+responseVal.NumberOfEmployees+'   '+responseVal.AccountNumber+'  '+
                      
                      responseVal.Website);
                
            }
            
        });
        
        $A.enqueueAction(action);
    },
    
    showNumber: function(component, event, helper) {
        var numbers = [];
        for (var i = 0; i < 20; i++) {
            numbers.push({
                value: 'Demo'+i
            });
        } 
        component.set("v.numbers", numbers);
    }

})