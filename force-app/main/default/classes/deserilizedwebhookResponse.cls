public class deserilizedwebhookResponse {

    public static void deserilizedData(String body){
        
        Map<String, Object> response_Map = (Map<String, Object>)JSON.deserializeUntyped(body);
        Map<String,object>  response_Map1= new Map<String ,object> ();
        Map<String,object>  response_Map2= new Map<String ,object> ();
        Map<String,object>  response_Map3= new Map<String ,object> ();
        System.debug('request body : :'+response_Map);
        List<Object> AccList =(List<Object>) response_Map.get('eventNotifications');
        System.debug('value of list are'+AccList);
        response_Map1=(Map<String,object>) AccList[0];
        System.debug(response_map1.get('dataChangeEvent'));
        response_Map2=(Map<String,object>) response_map1.get('dataChangeEvent');
        List<Object> AccList1 =(List<Object>) response_Map2.get('entities');
        System.debug(AccList1);
        response_Map3=(Map<String ,object>) AccList1[0];
        String Name=String.valueOf(response_Map3.get('name'));
        String Ids=String.valueOf(response_Map3.get('id'));
        String operation =String.valueOf(response_Map3.get('operation'));
        
        if(operation=='Create'){
            getDatafromQuickbook.main(Name);
        }else if(operation=='Update'){
        Quickbookevent__e quickbookevent=new Quickbookevent__e();
        quickbookevent.type__c =Name;
        EventBus.publish(quickbookevent);
        }
       // getGlobalDatafromQuickBook.getDatafrom(Ids);
        
       // AccountUpdation.updateAccount(ids);
        System.debug(response_Map3.get('name'));
        
    }    
}