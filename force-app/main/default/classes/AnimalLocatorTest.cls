@isTest
private class AnimalLocatorTest{
    @isTest static void testGetAnimalNameById() {
        Test.SetMock(HttpCallOutMock.class, new AnimalLocatorMock());
        string result = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('chicken', result);
    }
}