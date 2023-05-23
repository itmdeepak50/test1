public without sharing class GetOpportunity {
    
    @AuraEnabled
    public Static List<opportunity>GetOpportunity() {

          List<opportunity> opportunityList  = [select name,stagename, Owner.Name from opportunity order by owner.Name ];
          System.debug('Opportuntiy list==> '+opportunityList );
          system.debug('gross changes');
          System.debug('ADD NEW CHANGES ');
          System.debug('ADD FOR NEW CHECK');
          return opportunityList;
    }


}