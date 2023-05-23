public class XmlParsingBlueleaf {
    public Household__c temppro;
        
    public XmlParsingBlueleaf(String xml) {
   //     System.debug('XmlParsingBlueleaf9999 '+xml);
        try{
            Dom.Document doc = new Dom.Document();
            doc.load(xml);
            DOM.XmlNode rootNode=doc.getRootElement();
            DOM.XmlNode []all = rootNode.getChildelements();
            list<Household__c> Householdlist = new list<Household__c>();

            for(DOM.XmlNode child : all)
            {
                System.debug('childpr '+child.getChildElements());
                temppro = new Household__c();
                for(DOM.XmlNode c2 : child.getchildelements())
                {
                  //  System.debug('c2.getchif==== '+c2.getName());
                    if(c2.getName()=='email')
                   //     SYstem.debug('email99 '+c2.gettext().trim());
                        temppro.Email__c = c2.gettext().trim();
                    if(c2.getName()=='first-name')
                        temppro.First_Name__c = c2.getText().trim();
                    if(c2.getName()=='full-name')
                 //       System.debug('full-name '+c2.getText().trim());
                        temppro.Name = c2.getText().trim();
                    if(c2.getName()=='id')
                  //      System.debug('id '+c2.getText().trim());
                        temppro.Household_Id__c = c2.getText().trim();
                    if(c2.getName()=='last-name')
                        temppro.Last_Name__c = c2.getText().trim();
                   // System.debug('temppro-- '+temppro);
                }
                System.debug('temppro99 '+temppro);
                Householdlist.add(temppro);
             
            }
            System.debug('Householdlist '+Householdlist);
            if(Householdlist!=null){
            
            BlueleafBatchFile myBatchObject = new BlueleafBatchFile(Householdlist); 
            Id batchId = Database.executeBatch(myBatchObject);
            }
      
        }catch(Exception e)
        {
            System.debug('Exception '+e.getMessage()+'Line==> '+e.getLineNumber());
        }
}
 
}