@IsTest
private class AccountManagerTest {

    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        
        Contact Cont1 = new Contact();
        Cont1.LastName = 'ABC';
        Cont1.AccountId = recordId ;
        insert Cont1;

        Contact Cont2 = new Contact();
        Cont2.LastName = 'XYZ';
        Cont2.AccountId = recordId ;
        insert Cont2 ;
        
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://aledev91-dev-ed.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAcc = AccountManager.getAccount();
        // Verify results
        System.assert(thisAcc != null);
        System.assertEquals('Test Record', thisAcc.Name);
    }
    
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(
            Name='Test Record');
        insert accTest;
        return accTest.Id;
    }       
}