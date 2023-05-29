@isTest
private class ParkLocatorTest{
    @isTest 
    static void testParkLocator() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        Test.startTest();
        String[] arrayOfParks = ParkLocator.country('country1');
        Test.stopTest();
        System.assertEquals('Park1', arrayOfParks[0]);
    }
}