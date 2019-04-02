global class AccountProcessor {
 
  @future
  public static void countContacts(List<Id> accIds) {
    List<Account> lstAccount = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :accIds ];
      
      for (Account Acc : lstAccount){
          list<Contact> lstContact = acc.contacts ;
		  acc.Number_of_Contacts__c = lstContact.size();          
      }
      update lstAccount;
  }
    
}