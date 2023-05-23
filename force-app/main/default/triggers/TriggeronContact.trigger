trigger TriggeronContact on Contact (before insert) {
    
    if(trigger.isinsert && trigger.isbefore){
        
        ContactHandlerClass.contacthandle(trigger.new);
    }
    
    

}