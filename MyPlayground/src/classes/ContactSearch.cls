public class ContactSearch {
	
    public static List<Contact> searchForContacts (String LastName, String MailingPostalCode){
    	
        List<Contact> cct = new List<Contact>();
        
    	cct = [            
        			SELECT LastName, MailingPostalCode 
        			FROM Contact 
        			WHERE (LastName=:LastName AND MailingPostalCode=:MailingPostalCode)];       
    	
        return    cct;
    }
}