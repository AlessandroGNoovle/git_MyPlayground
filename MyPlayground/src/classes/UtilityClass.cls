public class UtilityClass {
    
    public static void createNewTask (case myCase){
        
        Task newTask = new Task(
        whatId = myCase.id      
        );
        
    }
    
    public static List<Id> createAccountAndContact(String AccountName, String AccountExternalId, String contactLastName){
        
        Account myAccount = new Account(
        Name = AccountName,
        id = AccountExternalId
        );
        
        //upsert myAccount;
        
        Contact myContact = new Contact(
        LastName = contactLastName,
        Accountid = myAccount.id
        );
        
        //insert myContact;
        
        list<id> myIdList = new list<id>();
        
        myIdList.add(myAccount.id);
        myIdList.add(myContact.id);
        
        return myIdList;        
        
    }

}