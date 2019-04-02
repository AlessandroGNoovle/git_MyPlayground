trigger TaskCreation on Case (after insert) {

    if (trigger.isInsert){
        if (trigger.isInsert){
        	ADT2016_CaseManagement.GenerateTaskAfterCaseCreation(trigger.New);               
        }        
    }
  
}