public class AddPrimaryContact implements Queueable {

    private Contact myContact;
    private string state;
        
    public AddPrimaryContact(Contact myContact, String state) {
    
        this.myContact = myContact;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {
        list<Account> myAccountList = new list<Account>();
        
        myAccountList = [SELECT id, BillingState FROM Account WHERE BillingState =: state LIMIT 200];
        
        for ( Account acc : myAccountList){
            
            Contact newContact = myContact.clone(false);
            newContact.accountId = acc.id;
            newContact.LastName = 'test prova';
            insert newContact;
            
        }
    }
    
}