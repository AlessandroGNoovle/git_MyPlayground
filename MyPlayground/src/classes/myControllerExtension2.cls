public class myControllerExtension2 {

    private final Account acc;
    public boolean editMode{
        Get{
            if(editMode == null)
                editMode = false;
            return editMode;}
        private Set{
            editMode = value;
        }
    }
    
    public list<Case> myCaseList{
        Get{
            myCaseList = [SELECT id, CaseNumber, Subject, Owner.Name, CreatedDate FROM Case WHERE Accountid =: ApexPages.currentPage().getParameters().get('id') ORDER BY CreatedDate DESC LIMIT 3 ];
            return myCaseList;}
        private Set{}
    }
    
    public list<Opportunity> myOpportunityList{
        Get{
            myOpportunityList = [SELECT id, Name, StageName, Amount, CloseDate FROM opportunity WHERE Accountid =: ApexPages.currentPage().getParameters().get('id') ORDER BY CreatedDate DESC LIMIT 3 ];
            return myOpportunityList;}
        private Set{}
    }
    
    public myControllerExtension2(ApexPages.StandardController stdController) {
        this.acc = (Account)stdController.getRecord();
    } 
    
    public pageReference editAccount(){
        
        editMode = true;       
        return null;
        
    }
    
}