@isTest
private class AccountProcessorTest {
    @isTest static void testAccountProcessorTest() {
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        
        Contact c = New Contact();
        c.LastName ='Test Contact';
        c.AccountId = a.Id;
        Insert c;
        
        List<Id> setAccId = new List<Id>();
        setAccId.add(a.id);
        
        Test.startTest();
        AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account Acc = [SELECT Number_of_Contacts__c FROM Account WHERE id = :a.id];
        System.assertEquals(Integer.valueOf(Acc.Number_of_Contacts__c) ,1);
    }
}