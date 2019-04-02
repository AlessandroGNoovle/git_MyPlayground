@isTest
public class AddPrimaryContactTest {

    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add 50 accounts NY
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account '+i,
                billingState = 'NY'
            ));
        }
        insert accounts;
        // add 50 accounts CA
        for (Integer i = 50; i < 100; i++) {
            accounts.add(new Account(
                name='Test Account '+i,
                billingState = 'CA'
            ));
        }
        upsert accounts;
    }
    
    static testmethod void testQueueable() {
        //contact to be inserted
        Contact myContact = new Contact();        
        // Create our Queueable instance
        AddPrimaryContact adder = new AddPrimaryContact(myContact, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(adder);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId 
        List<Account> accounts = [select id, name from account where name like 'Test Account %' and billingState = 'CA'];
        System.assertEquals(50, [select count() from contact]);
    }
    
    
    
    
}