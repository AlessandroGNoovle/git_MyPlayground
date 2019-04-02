@isTest
private class TestRestrictContactByName {
    @isTest static void TestInsertOrUpdateContact(){
        
		//insert listaContatti;
		List<Contact> listaContatti = new List<Contact>();
		Contact c1 = new Contact(FirstName='Alessandro', LastName='Guarnieri');
		Contact c2 = new Contact(FirstName='Alessandro', LastName = 'INVALIDNAME');
		listaContatti.add(c1);
		listaContatti.add(c2);
				
		// Perform test
        Test.startTest();
            try
            {
                insert listaContatti;
            }
            catch(Exception ee)
            {
            }
        Test.stopTest();
	}
	
}