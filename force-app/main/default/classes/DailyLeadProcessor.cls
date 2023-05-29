public with sharing class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, Name
            FROM Lead
            WHERE LeadSource = null];

        List<Lead> newLeads = new List<Lead>();
        for(Lead ld: leads) {
            ld.LeadSource = 'Dreamforce';
            newLeads.add(ld);
        }
        update newLeads;
    }
}