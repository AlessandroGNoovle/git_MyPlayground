public class ContactAndLeadSearch {
                        
    public static List<List< SObject>> searchContactsAndLeads (string NoC) {
                
        List<List<SObject>> ciao = [FIND :NoC IN NAME FIELDS RETURNING Contact(FirstName, LastName),  
            								 						 Lead(FirstName, LastName)];        
    
      return ciao;
    } 
  
}