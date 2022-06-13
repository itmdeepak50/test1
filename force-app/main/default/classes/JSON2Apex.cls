public class JSON2Apex {
    
    
    public class Account {
        public String FullyQualifiedName {get;set;} 
        public String domain {get;set;} 
        public String Name {get;set;} 
        public String Classification {get;set;} 
        public String AccountSubType {get;set;} 
        public CurrencyRef CurrencyRef {get;set;} 
        public Integer CurrentBalanceWithSubAccounts {get;set;} 
        public Boolean sparse {get;set;} 
        public MetaData MetaData {get;set;} 
        public String AccountType {get;set;} 
        public Integer CurrentBalance {get;set;} 
        public Boolean Active {get;set;} 
        public String SyncToken {get;set;} 
        public String Id {get;set;} 
        public Boolean SubAccount {get;set;} 
        
        public Account(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'FullyQualifiedName') {
                            FullyQualifiedName = parser.getText();
                        } else if (text == 'domain') {
                            domain = parser.getText();
                        } else if (text == 'Name') {
                            Name = parser.getText();
                        } else if (text == 'Classification') {
                            Classification = parser.getText();
                        } else if (text == 'AccountSubType') {
                            AccountSubType = parser.getText();
                        } else if (text == 'CurrencyRef') {
                            CurrencyRef = new CurrencyRef(parser);
                        } else if (text == 'CurrentBalanceWithSubAccounts') {
                            CurrentBalanceWithSubAccounts = parser.getIntegerValue();
                        } else if (text == 'sparse') {
                            sparse = parser.getBooleanValue();
                        } else if (text == 'MetaData') {
                            MetaData = new MetaData(parser);
                        } else if (text == 'AccountType') {
                            AccountType = parser.getText();
                        } else if (text == 'CurrentBalance') {
                            CurrentBalance = parser.getIntegerValue();
                        } else if (text == 'Active') {
                            Active = parser.getBooleanValue();
                        } else if (text == 'SyncToken') {
                            SyncToken = parser.getText();
                        } else if (text == 'Id') {
                            Id = parser.getText();
                        } else if (text == 'SubAccount') {
                            SubAccount = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Account consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class CurrencyRef {
        public String name {get;set;} 
        public String value {get;set;} 
        
        public CurrencyRef(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'value') {
                            value = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'CurrencyRef consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public Account Account {get;set;} 
    public String time_Z {get;set;} // in json: time
    
    public JSON2Apex(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'Account') {
                        Account = new Account(parser);
                    } else if (text == 'time') {
                        time_Z = parser.getText();
                    } else {
                        System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }
    
    public class MetaData {
        public String CreateTime {get;set;} 
        public String LastUpdatedTime {get;set;} 
        
        public MetaData(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'CreateTime') {
                            CreateTime = parser.getText();
                        } else if (text == 'LastUpdatedTime') {
                            LastUpdatedTime = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'MetaData consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    
    public static JSON2Apex parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return new JSON2Apex(parser);
    }
    
    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT || 
                curr == System.JSONToken.START_ARRAY) {
                    depth++;
                } else if (curr == System.JSONToken.END_OBJECT ||
                           curr == System.JSONToken.END_ARRAY) {
                               depth--;
                           }
        } while (depth > 0 && parser.nextToken() != null);
    }
    
    
    
    
    
    
}