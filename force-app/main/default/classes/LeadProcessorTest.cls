@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 200 accounts
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(
                Company = 'Company A', LastName = 'Test' + i, Status = 'Open'
            ));
        }
        insert leads;
    }
    @isTest static void testBatch() {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}