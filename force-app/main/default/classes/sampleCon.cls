public class sampleCon {
String[] countriess = new String[]{};
        //If multiselect is false, countries must be of type String
        //String countries;
            
        public PageReference test() {
            return null;
        }
            
        public List<SelectOption> getItemss() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('US','US'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));
            return options;
        }
            
        public String[] getCountries() {
            //If multiselect is false, countries must be of type String
            System.debug('in getcountry '+countriess);
            return countriess;
        }
            
        public void setCountries(String[] countries) {
            //If multiselect is false, countries must be of type String
            System.debug('in setcountry '+countries);
            this.countriess = countries;
        }
    }