global class LeadProcessor implements 
    Database.Batchable<sObject>, Database.Stateful {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID, LeadSource FROM Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> myLeads = new List<Lead>();
        for (Lead myLead : scope) {
            myLead.LeadSource = 'Dreamforce';
            myLeads.add(myLead);
            }        
        update myLeads;
    }    

    global void finish(Database.BatchableContext bc){
    }    

}