({
    doInit: function(component,event,helper){
        var action = component.get('c.data');
            action.setCallback(this, function(response){ 
            var state = response.getState();
            if(state === 'SUCCESS') { 
                //getting the list of accounts
                console.log('hii value are i am excute after the big===>')
                component.set('v.listOfAccounts', response.getReturnValue());
                helper.ShowHideAll(component,event,helper);
                
            } 
            else{
                alert('ERROR...');
            }
        });
    $A.enqueueAction(action);
    },
    
    handleSectionToggle : function(component,event,helper){
    console.log('pressed');
    helper.handleSectionToggle1(component,event,helper); 
    },
    handleSectionToggle2 :function(component,event,helper){
        var value = event.getParam("openSections")
        var len=[];
        len = sessionStorage.getItem(1).split(',');
        var v = component.get("v.call");
        if(v){
        console.log('hii this is totlly called',value);
            helper.handleSectionToggle1(component,event,helper);
        }else{
           console.log('hii this is totlly called123',value.length);
                }
    }    
})