trigger DocuConUpdatefieldDocu on dfsle__EnvelopeStatus__c (before insert ,after update) {
if(trigger.isafter &&  trigger.isupdate){
    
    
        System.debug('trigger new list'+trigger.new);    
        System.debug('trigger new old'+trigger.old); 
    
       // List<dfsle__EnvelopeStatus__c> dList=new List<dfsle__EnvelopeStatus__c>(trigger.new);
        //for(dfsle__EnvelopeStatus__c dcc: dList ){
          // System.debug(dcc);
         //}
    

       //System.debug(trigger.new +'>>>>>>>>'+trigger.old);
        //dfsle__EnvelopeStatus__c acc = new dfsle__EnvelopeStatus__c();
        //acc = [select dfsle__Status__c from dfsle__EnvelopeStatus__c where dfsle__DocuSignId__c =dList[0].];
        
    
    for(dfsle__EnvelopeStatus__c obj : trigger.new){
        
         if(obj.dfsle__Status__c=='completed'){
            Contact conInstence=new Contact();
            conInstence.id=obj.dfsle__SourceId__c;
            conInstence.DocuSignCompleted__c=true;
            update conInstence;
        }else{
            Contact conInstence1=new Contact();
            conInstence1.id=obj.dfsle__SourceId__c;
            conInstence1.DocuSignCompleted__c=false;
            update conInstence1;
             
        }
    }
       
    
    
    
}
}