({
	 
    handleSectionToggle1: function(component,event,helper){
            var openSections = event.getParam('openSections');
            console.log('opensectioName',openSections);
            console.log('hii value are formate way');
            sessionStorage.setItem(1,openSections);
                        
       },
    ShowHideAll:function(component,event,helper){
        console.log('hii i amhelper 87624872368746')
        let activeSections = component.get("v.activeSections");
     
          var a=[];
        if(sessionStorage.getItem(1)!=null){
        console.log ('hii value are',sessionStorage.getItem(1))
        console.log('blao',component.get('v.activesename'));
        a=sessionStorage.getItem(1).split(',');
        console.log('hii value are big')
        component.set("v.activeSections",a);
        }
            console.log('sdasdasdasd',component.get('v.activeSections'));
            component.set("v.call",true)
        }
        
   
    
 
 
})