public with sharing class AddPrimaryContact implements Queueable {
    private Contact cont;
    private String state;

    public AddPrimaryContact(Contact cont, String state) {
        this.cont = cont;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        List<Account> ListAccount = [
            SELECT ID
            FROM ACCOUNT 
            WHERE BillingState = :state 
            LIMIT 200
        ];

        List<Contact> lstContact = new List<Contact>();
        for (Account acc: ListAccount){
            Contact c = cont.clone(false,false,false,false);
            c.AccountId =  acc.id;
            lstContact.add(c);
        }
        
        insert lstContact;
    }
}