trigger opptriger on Opportunity (after update) {

if(trigger.isupdate && trigger.isafter){

    User_message__e me = new User_message__e();
    me.Message__c = 'This is only for testing';
    EventBus.publish(me);

}


}