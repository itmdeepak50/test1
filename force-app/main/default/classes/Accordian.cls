public  with sharing class Accordian {
    @AuraEnabled(cacheable=true)
    public static WrapperOfRecords getRecords(String s){
        String sr = '%'+s+'%';
        set<id> acids =new set<id>();
        set<id> userids =new set<id>();
      
        
        
        List<Contact> conList =[select name,phone,email,Account.name,AccountId from contact where name Like:sr and accountid!=null];
        System.debug(conList.size());
        for(contact ab : conList){
            acids.add(ab.AccountId);
        }
        List<Account> accList =[select name,ownerID,(select name,phone,email,account.name from contacts  where name Like:sr) from account  where id IN:acids];
        for(account bc : accList){
            userids.add(bc.ownerId);
        }
        List<user> userList =[select name from user where id IN:userids];
        
     
        List<WrapperOfRecords.accountData> bv =new List<WrapperOfRecords.accountData>();
        List<WrapperOfRecords.userData> usd =new List<WrapperOfRecords.userData>();
        WrapperOfRecords wr =new WrapperOfRecords();
        for(user a : userList){        
        WrapperOfRecords.userData userdata =new WrapperOfRecords.userData();            
            userdata.name = a.name;
                        
            for(Account b : accList){
                WrapperOfRecords.accountData accdata =new WrapperOfRecords.accountData();
                accdata.name = b.Name;
                accdata.ids=b.id;
                List<contact> cv = new List<contact>(b.contacts);
                accdata.con=cv;
                bv.add(accdata);
                System.debug(userdata.acc);
            }
            userdata.acc = bv;
            usd.add(userdata);
        }
        wr.users=usd;
      System.debug(Json.serialize(wr));
        
        /*if(!conList.isEmpty()){
         List<WrapperOfContact.condata> clist= new List<WrapperOfContact.condata>();
         WrapperOfContact wr = new WrapperOfContact();
         for(contact ab : conList){
            WrapperOfContact.condata cdata =new WrapperOfContact.condata();
             cdata.name=ab.Name;
             cdata.phone=ab.Phone;
             cdata.email=ab.Email;
             cdata.acname=ab.Account.Name;
             cdata.conId=ab.id;
             cdata.nameUrl='/'+ab.Id;
             if(ab.AccountId!=null){
             cdata.accnameurl='/'+ab.AccountId;
             }else{
              cdata.accnameurl=null;
             }
             clist.add(cdata);
         }
       wr.con=clist;
       System.debug(wr);
       return wr;
        }else{
            return null;
        }*/
        
        return wr;
    } 
}