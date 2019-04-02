global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        list<Lead> myLeadList = [SELECT id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        
        for (lead myLead : myLeadList){
            
            myLead.LeadSource = 'Dreamforce';
            
        }
        update myLeadList;
    }
}