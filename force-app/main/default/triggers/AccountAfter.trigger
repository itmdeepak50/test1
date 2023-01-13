trigger AccountAfter on Account (before insert,after insert ,after update) {

    if(trigger.isafter && trigger.isInsert){
      HandlerclassOnAccounttrigger.main(trigger.new);
    
    }else if(trigger.isbefore && trigger.isInsert){
        System.debug('hii to all');
    }else if(trigger.isupdate && trigger.isafter ){
        
        HandlerclassOnAccounttrigger.main(trigger.new);
    }
    
}