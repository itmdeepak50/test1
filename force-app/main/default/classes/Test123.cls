public class Test123 {
    
    
    public static void getobjectFields(String objectname , List<String> fields1 ,String value){
        List<SObject> records = new List<SObject>();
        String SobjectApiName = objectname ;
        List<String> FieldList = new List<String>();
        List<String> finalfields = new List<String>();
        
        Map<String,String> fieldsMap = new Map<String,String>();

        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
        for(String fieldName : fieldMap.keyset() )
        {
          Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
            if(fielddataType == Schema.DisplayType.String){
                String fieldLabel = fieldMap.get(fieldName).getDescribe().getLabel();
                fieldsMap.put(fieldLabel,fieldName);
              
            } 
         }
        
        System.debug('value intial fields'+fieldsMap);
        for(String ab :fields1){
            System.debug('value intial fields'+fields1);
            if(fieldsMap.containsKey(ab)){
                finalfields.add(String.valueOf(fieldsMap.get(ab)));
            }
        }
        System.debug('value of fields' +finalfields);
       
        try {
            // Create a SOQL query
            String query = 'SELECT ';
            for (String field : finalfields) {
                query += field + ', ';
            }
            query = query.substring(0, query.length() - 2);
            query += ' from '+objectname;
            query += ' limit 5';
            System.debug('query' + query);
            records = Database.query(query);
            for(Sobject ab : records){
                for(String bc : finalfields){
                    ab.put(bc,ab.get(bc)+value);
                }
            }
           System.debug('updated record '+records);
          } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage()+'   LINE NUMBER '+e.getLineNumber());
        }
        
        
        }
        
        
    }