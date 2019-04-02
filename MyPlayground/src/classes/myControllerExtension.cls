public class myControllerExtension {
	
    private final Case c;
    
    public myControllerExtension(ApexPages.StandardController stdController) {
        this.c = (Case)stdController.getRecord();
    }
    
    public CaseComment comment{
    	get {
            list<CaseComment> commentList = new list<CaseComment>();
            if (comment == null){                 
                commentList = [SELECT id, CommentBody, CreatedById FROM CaseComment WHERE parentid =: ApexPages.currentPage().getParameters().get('id') LIMIT 1];
                If (commentList.size() == 0){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'The case does not have any comments'));
                } else {
                    
                    comment = commentList[0];
                }
                
            }
            
        return comment;
      	}
        private set;  
    }

}