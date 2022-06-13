public class Script3_NoOfContact {
    
    public static void no_ofContact(List<Account> acc_list){
        try{
            List<Account> acc1_list=[select NumberOfEmployees from Account where id IN:acc_list];
            
            List<Contact> con_list=new List<Contact>(); 
            for(Account acc: acc1_list){
                for(integer i=0;i<acc.NumberOfEmployees;i++){
                    Contact con_ins=new Contact();
                    con_ins.LastName='Demo'+i;
                    con_ins.AccountId=acc.Id;
                    System.debug(acc.NumberOfEmployees);
                    con_list.add(con_ins);
                    
                }
                
            }
            if(con_list.size()>0){
                insert con_list;
            }
        }catch(Exception e){
            System.debug(e.getLineNumber()+'>>>>'+e.getMessage());
        }
    }
    
    public static void updateNo_ofContact(List<Account> newAcc_list){ 
        try{ 
            System.debug('>>>>>>'+newAcc_list);
            List<Contact> insert_list=new List<Contact>();    
            List<Contact> delete_list=new List<Contact>();
            Map<id,List<Contact>> newcon_map=new Map<id,List<Contact>>();        
            List<Account> numofEmp=[Select NumberOfEmployees from Account where id IN:newAcc_list];
            System.debug(numofEmp);
            List<Contact> newCon_list=[select id,lastname,Accountid,Account.NumberOfEmployees from Contact where Accountid IN:newAcc_list];
             System.debug(newCon_List);
            for(Contact cc: newcon_list){
                if(!newcon_map.containsKey(cc.AccountId)){
                    List<Contact> conls=new List<Contact>();
                    conls.add(cc);
                    
                    newcon_map.put(cc.AccountId,conls);
                    
                }else{
                    List<Contact> conls=newcon_map.get(cc.AccountId);
                    conls.add(cc);
                    newcon_map.put(cc.AccountId,conls);
                }
            }
            
            
            for(Account acc:numofEmp){
                List<Contact> sizeList=newcon_map.get(acc.Id);
                integer count;
                if(sizeList==null){
                    count=0;
                }else{
                    count = sizeList.size();  
                }
               
                
                
                if(acc.NumberOfEmployees>count){
                    
                    for(integer i=0;i<acc.NumberOfEmployees-count;i++){
                        Contact cre_con=new Contact();
                        cre_con.LastName='Demo'+i;
                        cre_con.AccountId=acc.Id;
                        insert_list.add(cre_con);
                    }
                    
                    
                }else{
                    System.debug('kjdbkjdb');
                    for(integer i=0;i<count-acc.NumberOfEmployees;i++){
                        delete_list.add(sizeList[i]);
                        
                    }
                }
                
            }
            
            if(insert_list.size()>0){
                insert insert_list;
            }
            if(delete_list.size()>0){
                delete delete_list;
            }
            
        }catch(Exception e){
            System.debug(e.getLineNumber()+'>>>>>>>'+e.getMessage());
        }     
        
    }   
}