trigger BeforeInsAccount on Account (before insert) {   
    
    list<Account> myList = new list<Account>(); 
    for (Account newAcc : trigger.new){
        //newAcc.phone = null;
        newAcc = null;
        myList.add(newAcc);
    }
    
}