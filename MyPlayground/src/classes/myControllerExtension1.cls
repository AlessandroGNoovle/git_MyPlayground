public class myControllerExtension1 {

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
    
    public myControllerExtension1(ApexPages.StandardController stdController) {
        this.acc = (Account)stdController.getRecord();
    } 
    
    public pageReference editAccount(){
        
        editMode = true;
        
        return null;
        
    }
    
}