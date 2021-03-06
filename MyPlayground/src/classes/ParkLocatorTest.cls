@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String C = 'Japan';
        String[] result = ParkLocator.Country(C);
        // Verify that a fake result is returned
        System.assertEquals(new list<String>{'primo','secondo'}, result); 
    }
}