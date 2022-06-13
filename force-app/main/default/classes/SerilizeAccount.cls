public class SerilizeAccount {

    public Static String serilizeAccData(List<String> accList){
        
        wrapperAccData wrAcdata=new wrapperAccData();
        wrAcdata.Name=accList[0];
        wrAcdata.AccountType=accList[1];
        String str=Json.serialize(wrAcdata);
        System.debug(str);
        return str;
    }
    
    
    public class wrapperAccData{
        public String Name;
        public String AccountType;
        
    }
    
    
    
    
}