trigger LeadTrigger on Lead (after insert) {
    
    if(trigger.isInsert && trigger.isafter){
        
        LeadAssignClassNew.MethodLeadAssignClassNew(trigger.new);
    }

}