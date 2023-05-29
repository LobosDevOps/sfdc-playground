@IsTest
private class AccountManagerTest{
    @isTest static void testAccountManager(){
        Id recordId = getTestAccountId();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://wise-otter-p7fk8n-dev-ed.trailblaze.lightning.force.com/services/apexrest/Accounts/'+ recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        // Call the method to test
        Account acc = AccountManager.getAccount();
        
        // Verify results
        System.assert(acc != null);
        System.assert('TestAcc2' == acc.Name);
        System.assert('TestCont2' == acc.contacts[0].Name);
    }
    
    private static Id getTestAccountId(){
        Account acc = new Account(Name = 'TestAcc2');
        Insert acc;
         
        Contact con = new Contact(LastName = 'TestCont2', AccountId = acc.Id);
        Insert con;
        
        return acc.Id;
    }
}