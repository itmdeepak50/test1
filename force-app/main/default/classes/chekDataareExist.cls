public class chekDataareExist {
      @AuraEnabled
      public static String chekData(String acname){
        String value =null;
        
        if(acname!=''){
        List<Account> acList=[select Name,id from Account where Name=:acname ];
            if(acList.size()>0){
                value =acList[0].id;
                
            }  else{
                value = null;
            }
            }
        
        return value ;
    }
    
    
    @AuraEnabled
    public static boolean saveData(string acid , string conlname, String conphone, string email,String exid){
        System.debug('hiiiii'+exid);
        boolean v=false;
        Contact con =new contact();
        con.LastName=conlname;
        con.Email=email;
        con.Phone=conphone;
        con.AccountId=acid;
        con.Exid__c=exid;
        Database.upsert(con,contact.Exid__c,false);
        v=true;
        
        return v;
    }
    
    @AuraEnabled
    public static boolean saveData1(string acname , string conlname, String conphone, string email,string exid){
        boolean v=false;
        
        Account acc =new Account();
        acc.Name=acname;
        insert acc;
                    
        Contact con =new contact();
        con.LastName=conlname;
        con.Email=email;
        con.Phone=conphone;
        con.AccountId=acc.id;
        con.Exid__c=exid;
        
        upsert con Exid__C;
        v=true;
        
        return v;
    }
    
    
    
   
}