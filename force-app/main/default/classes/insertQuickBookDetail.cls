public class insertQuickBookDetail {
    @AuraEnabled
    public static String setQuickBookData(List<String> objData1){
        String value=null;
        
     List<UpdateAuthcode__c> updateouthCode=[select Aouthcode__c from UpdateAuthcode__c limit 1]; 
        UpdateAuthcode__c aouthcode = new UpdateAuthcode__c();
        Quickbook__c quickbook=new Quickbook__c();
        if(updateouthCode[0].Aouthcode__c!=null){ 
        system.debug('value are happy::'+updateouthCode[0].Aouthcode__c);
        quickbook.Name=objData1[0];
        quickbook.Client_id__c=objData1[1];
        quickbook.Client_secret__c =objData1[2];
        quickbook.realmId__c = objData1[3];
        aouthcode.id='a0d5g000002hxWJAAY'; 
        aouthcode.Aouthcode__c=null;
        insert quickbook;
        value = 'abc';    
        update aouthcode;    
        }else{
            value=null;
        }     
        return value;
    }
    @AuraEnabled 
    public static String setAouthcode(String Ocode){
       UpdateAuthcode__c updatecode=new UpdateAuthcode__c();
       updatecode.id='a0d5g000002hxWJAAY';
       updatecode.Aouthcode__c=Ocode; 
       update  updatecode;
       return Ocode;
   }
    
    
}