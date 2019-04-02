@isTest
public class DailyLeadProcessorTest {
	
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // add 200 leads
        for (Integer i = 0; i < 201; i++) {
            leads.add(new Lead(
                lastName = 'hello '+ i,
                Company = 'Deloitte',
            	LeadSource = null));
        }
        insert leads;
    }
    
    static testmethod void testSchedulable() {
    	
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        Test.stopTest();
        
        System.assertEquals(200, [select count() from Lead WHERE LeadSource = 'Dreamforce']);
    }
}