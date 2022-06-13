trigger Trigger_onAccount on Account (after insert ,after update ) {
    if(trigger.isAfter && trigger.isInsert){
        //Script3_NoOfContact.no_ofContact(trigger.new);
    
    }else if(trigger.isafter && trigger.isupdate){
        
         //Script3_NoOfContact.updateNo_ofContact(trigger.new);
    }
    
    
    
}