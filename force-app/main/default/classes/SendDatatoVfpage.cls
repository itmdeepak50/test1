public class SendDatatoVfpage {
    
    public  string var = 'Hello world';
      public PageReference nextPage() {
        PageReference pg = new PageReference('/apex/NextPage');
        pg.getParameters().put('str', var);
        pg.setRedirect(false);
        //String v = pg.getContent().toString();
        return pg;
        
    }
    
    
    

}