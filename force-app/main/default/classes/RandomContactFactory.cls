public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String key) {
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0; i<numContacts; i++) {
            Contact con = new Contact(FirstName = key + i);
            contacts.add(con);
        }
        return contacts;
    }
}