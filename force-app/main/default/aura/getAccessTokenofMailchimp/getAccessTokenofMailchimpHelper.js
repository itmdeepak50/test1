({
  doInit : function(component,Event,helper){
        var myPageRef = component.get("v.pageReference");
        var url = window.location.href;
        console.log('hii pageres hii',url);
        var url1 = new URL(url);
        var c = url1.searchParams.get("code");
        console.log('hii pageres hii',c);
     
        var url = window.location.href;
       
        if(c!=null && c.trim().length!=null && c!=undefined){
            var action=component.get("c.doFetchAccessToken");
            action.setParams({
                'code' : c,
                'redirectUri' : url.substr(0, url.indexOf('?'))
            });
            action.setCallback(this, function(response){
                var state =response.getState();
                if(state==='SUCCESS'){
                    var res = response.getReturnValue();
                    component.set('v.accessToken',res);
                }
            });
            $A.enqueueAction(action);
        }
      
    },
    handleClick : function(component, event, helper) {
        console.log('hii val1')
        var action=component.get("c.connectToMailchimp");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state =response.getState();
            if(state==='SUCCESS'){
                        console.log('hii val1')

                var res = response.getReturnValue();
                //console.log('URL FOR Mailchimp LOGIN-'+res.url);
                if(res.Error === undefined) {
                    console.log('Mailchimp Login Started');
                    window.open(res.url, '_self');
                }
                else if (res.Error != undefined && res.Error != null){
                    
                }
            } else if (state === 'ERROR'){
                console.log('Mailchimp Login Failed: ERROR');
            }
        });
        $A.enqueueAction(action);
    }
    
})