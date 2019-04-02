@isTest
private class TestVerifyDate {

    @isTest static void testCheckDates() {
        Date data = VerifyDate.CheckDates(System.today(), System.today()+1);
        System.assertEquals(System.today()+1, data);
    }
    
    @isTest static void testCheckDates1() {
        Date data = VerifyDate.CheckDates(System.today(), System.today()+60);
        System.assertEquals(System.today()+17, data);
    }    

    @isTest static void testDateWithin30Days() {
        Boolean data = VerifyDate.DateWithin30Days(System.today(), System.today()-1);
        System.assertEquals(false, data);
    } 

    @isTest static void testDateWithin30Days1() {
        Boolean data = VerifyDate.DateWithin30Days(System.today(), System.today()+60);
        System.assertEquals(false, data);
    }    
    
    @isTest static void testDateWithin30Days2() {
        Boolean data = VerifyDate.DateWithin30Days(System.today(), System.today()+5);
        System.assertEquals(true, data);
    }  
    
    @isTest static void testSetEndOfMonthDate() {
        Date data = VerifyDate.SetEndOfMonthDate(System.today());
        System.assertEquals(System.today()+17, data);
    }  
}