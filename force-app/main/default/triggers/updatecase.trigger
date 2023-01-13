trigger updatecase on Account (before insert,before update) {

    if(trigger.isafter && trigger.isupdate){
        HandlerclassOnAccounttrigger.main(trigger.old);
    }
    
}