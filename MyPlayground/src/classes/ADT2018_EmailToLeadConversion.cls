global class ADT2018_EmailToLeadConversion implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
    // Create an InboundEmailResult object for returning the result of the Apex Email Service 
    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
    
    //String myPlainText= '';
    // Add the email plain text into the local variable  
    //myPlainText = email.plainTextBody;
	
    // Check for existing contacts with this email address   
    Contact[] myContactsList = [SELECT Id, Name, Email, Accountid
      FROM Contact
      WHERE Email = :email.fromAddress];
        
        if (myContactsList.size() > 0){
        
            List<Opportunity> myOpportunityList = new list<Opportunity>();
            
            for (contact c : myContactsList){
                            
                Opportunity newOpportunity = new Opportunity(
                    Name = Email.subject,
                    Description = Email.plainTextBody,
                    CloseDate = System.today() + 7,
                    StageName = 'Prospecting',
                    Accountid = c.AccountId                 
                );
                
                myOpportunityList.add(newOpportunity);
                    
            }
            
            insert myOpportunityList;
            
        } else {
        
            // Check for existing leads with this email address   
            Lead[] myLeadsList = [SELECT Id, Name, Email, Description, Company, LastName
              FROM Lead
              WHERE Email = :email.fromAddress];
        
            if (myLeadsList.size() == 0) {
              // New Lead object to be created -
              Lead newLead = new Lead(
                LastName = 'From Email', 
                Company = 'TBD',
                Description = Email.plainTextBody );
        
              // Insert a new lead
              insert newLead;    
        
              System.debug('New Lead record: ' + newLead );  
                
            } else {
                
                for (Lead l : myLeadsList){
                        
                    l.description = email.plainTextBody;
                }
                
                update myLeadsList;
                     
            }
            
        }
        
    // Set the result to true. No need to send an email back to the user      
    // with an error message   
    result.success = true;
    result.message = 'The message was recieved. Thanks for contacting the company';

    // Return the result for the Apex Email Service 
    return result;
  }
    
}