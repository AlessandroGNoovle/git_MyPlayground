public class testcontroller123 {
    Public Account accobj{get;set;}
    public testcontroller123(ApexPages.StandardSetController controller) {
        accobj= new Account();
    }
    
    Public void save(){
        Account acc=new Account();
        acc.Name=accobj.Name;
        acc.Phone=accobj.Phone;
        insert acc;
    }

}