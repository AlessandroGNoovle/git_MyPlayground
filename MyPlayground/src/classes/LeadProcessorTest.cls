@isTest
private class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List<Lead> myLeads = new List<Lead>();
        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            myLeads.add(new Lead(LastName='Lead '+i, Company = 'Deloitte'));
        }
        insert myLeads;
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor LP = new LeadProcessor();
        Id batchId = Database.executeBatch(LP);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        list<Lead> finalLead = [select LeadSource from Lead where LeadSource = 'Dreamforce'];
        System.assertEquals(200, finalLead.size());
    }
    
}