@isTest
private class TestRestrictContactByName {
    @isTest static void testBeforeInsertSuccess() {
        List<Contact> contactList = new List<Contact>();

        Contact c1 = new Contact(LastName = 'Not1INVALIDNAME');
        Contact c2 = new Contact(LastName = 'Not2INVALIDNAME');
        contactList.add(c1);
        contactList.add(c2);
        
        Test.startTest();
        Database.SaveResult[] srList = Database.insert(contactList, false);
        Test.stopTest();

        Integer successCount = 0;
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                successCount++;
            }
        }
        System.assertEquals(successCount, contactList.size());
    }

    @isTest static void testBeforeInsertError() {
        List<Contact> contactList = new List<Contact>();

        Contact c1 = new Contact(LastName = 'INVALIDNAME');
        Contact c2 = new Contact(LastName = 'Not2INVALIDNAME');
        contactList.add(c1);
        contactList.add(c2);
        
        Test.startTest();
        Database.SaveResult[] srList = Database.insert(contactList, false);
        Test.stopTest();

        Integer successCount = 0;
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                successCount++;
            }
        }
        System.assertNotEquals(successCount, contactList.size());
    }
}