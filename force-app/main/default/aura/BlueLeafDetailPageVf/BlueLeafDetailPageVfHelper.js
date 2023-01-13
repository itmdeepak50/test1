({
    helperMethod : function(component,newid) {
        var state =null;
        var isvalue=null;
        var message=null;
        var type=null;
        var title=null;
        console.log('here reached');
        var action = component.get("c.getRecords");
         console.log('action Id are',action);
        console.log('Record Id are',newid);
        action.setParams({
            id : newid
        })
      action.setCallback(this,function(res){
             state =res.getState();
             if(state=="SUCCESS"){
              console.log('final result after sec',res.getReturnValue());
              var result = res.getReturnValue(); 
                 if(result== 'Invalid Email Address'){
                      message ="Please Enter Valid Email Address";
                      type ="warning";
                      title="Insert Record Failed"
                     
                     this.showToast(component,event ,message,type,title);
                     
                 }else if(result=="Successfully Created"){
                      message ="Household Created Successfully";
                      type ="success";
                      title="Household Created Successfully"
                      this.showToast(component,event ,message,type,title);
                      
                 }else if(result=="Email_In_Use") {
                     console.log('in exist part');
                     message ="Email Already In use";
                      type ="warning";
                      title="Record Already Exist"
                      this.showToast(component,event ,message,type,title);
                     
                 } 
             
             } else if (state === "ERROR") {
                 var errors = response.getError();
                 if (errors) {
                     if (errors[0] && errors[0].message) {
                         console.log("Error message: " +errors[0].message);
                     }
                 } else {
                     console.log("Unknown error");
                 }
             }
          $A.get("e.force:closeQuickAction").fire();
          
      })
      console.log('before the enqueueaction')
      $A.enqueueAction(action);
        
    },
    
    showToast : function(component, event,message,type,title) {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": title,
        "message": message,
        "type" : type
    });
    toastEvent.fire();
}
    
    
    
    
})