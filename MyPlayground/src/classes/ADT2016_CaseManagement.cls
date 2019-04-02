public class ADT2016_CaseManagement {

    public static void GenerateTaskAfterCaseCreation (List<Case> caseList){
        
    list<Task> myTaskList = new list <Task>();
    list<feedItem> feedListToInsert = new list <FeedItem>();
    
    for (case myCase : caseList){
        
        Task myTask = new Task();
        myTask.Subject = 'Contact the customer';
        myTask.whatId = myCase.id;
        
        myTaskList.add(myTask);
        
        feedListToInsert.add(new FeedItem(ParentId = myCase.OwnerId,
    						Body = 'A new task related to case Number ' + myCase.CaseNumber + ' was assignet to you. Please ensure you follow up closely')); 
    }
          
	insert myTaskList;  
    insert feedListToInsert;
        
    }
    
    /*public static void preventCaseClosure (List<Case> caseList){
    
    list <id> myCaseId = new list<Id>();
        
    for (case myCase : caseList){
        
         
    }
          
	
    }*/
}