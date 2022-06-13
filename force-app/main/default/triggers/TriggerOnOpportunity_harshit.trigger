trigger TriggerOnOpportunity_harshit on Opportunity (before insert) {

    Script4_harshitTriggerOnOpportunity.stopUpdatingOpportunity(Trigger.new);
    
    
}