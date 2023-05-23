trigger Emailmessagetrigger on EmailMessage (before insert , after insert) {
    
    if(trigger.isinsert && trigger.isafter){
        System.debug('datat:::'+trigger.new);
        System.debug('VALUE OF id is   '+ trigger.new[0].id);
                System.debug('VALUE OF id is   '+ trigger.new[0].id);
        System.debug('from address  '+ trigger.new[0].fromAddress);
        System.debug('toaddress   '+ trigger.new[0].toAddress);
        emailmessage em = [select ReplyToEmailMessageId from emailmessage where id =:trigger.new[0].id  ];
        System.debug('Email message id is '+ em.ReplyToEmailMessageId);
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        // Set recipients to two contact IDs.
        // Replace IDs with valid record IDs in your org.
        message.toAddresses = new String[] {trigger.new[0].fromAddress};
            message.optOutPolicy = 'FILTER';
        message.subject = 'Opt Out Test Message';
        message.plainTextBody = 'This is the message body.';
        message.setInReplyTo(String.valueof(trigger.new[0].id));
        Messaging.SingleEmailMessage[] messages = 
            new List<Messaging.SingleEmailMessage> {message};
                Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '
                         + results[0].errors[0].message);
        }
        
        
        
        
    }
    
    
}