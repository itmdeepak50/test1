trigger CreateHouseHolds on Household__c (after Insert,after update) {
   if(trigger.isAfter)
   {
       if(trigger.isUpdate)
       {
           T1.main(trigger.new);
       }
   }
}