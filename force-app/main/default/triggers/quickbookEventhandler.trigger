trigger quickbookEventhandler on QuickbookEvent__e (after insert) {

    if(trigger.isafter && trigger.isinsert){
        System.debug('Events value are ::'+trigger.new[0]);
        getDatafromQuickbookquickEvent.getDatafromevent(trigger.new[0].type__C);
        
    }
    
    
}