public class ObjectData {
    @AuraEnabled
    public static List<String> getObjectData(){
        List<String> stdObjectNames = new List<String>();
        for ( Schema.SObjectType typ : Schema.getGlobalDescribe().values() ) {
            String name = String.valueOf(typ);
            
            if((!name.containsignorecase('history') && !name.containsignorecase('tag')&&
                !name.containsignorecase('share') && !name.containsignorecase('feed')) || 
               name.toLowerCase().right(3) ==  '__c'){      
                   stdObjectNames.add(name);
                   
               }
    
        }
        stdObjectNames.sort();
        
        return  stdObjectNames;
    }
    
    @AuraEnabled
    public static List<String> getfields(String obName){
        List<String> obList=new List<String>();
        String SobjectApiName = obName;
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
        for(String fieldName : fieldMap.keyset() )
        {
            
            obList.add(fieldMap.get(fieldName).getDescribe().getLabel());
        }   
        return obList;  
    }   
    @AuraEnabled
    public static List<String> getfieldType(String obName,String fieldName){
        
        String type=obName;
        String fieldsName=fieldName;
        Schema.DisplayType ret;
        String retu;
        List<String> str=new List<String>();
        Map <String, String> labelToAPIName = new Map <String, String> ();
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldsMap = leadSchema.getDescribe().fields.getMap();
        for (Schema.SObjectField field : fieldsMap.values())
        {
            labelToAPIName.put(field.getDescribe().getLabel(), field.getDescribe().getName());
        }
        
        String APINAME = labelToAPIName.get(fieldsName);
        str.add(APINAME);
        
        Schema.DisplayType fielddataType = fieldsMap.get(APINAME).getDescribe().getType();
        if(fielddataType != Schema.DisplayType.TextArea){
            // System.debug(fielddataType);
            ret=fielddataType;
            System.debug('chek'+ret.name());
            str.add(ret.name());
        }
        else if(fielddataType != Schema.DisplayType.String){
            //System.debug(fielddataType);
            ret= fielddataType;
            str.add(ret.name());
            System.debug('sdkj'+ret.name());
        }
        return str;
    }
}