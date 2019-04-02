trigger BeforeUpdAccount on Account (before update) {
	
	list<Account> myList = new list<Account>();    
    for (Account newAcc : trigger.new){
        system.debug('newAcc'+newAcc.phone);
        Account oldAcc = trigger.oldMap.get(newAcc.id);
        system.debug('oldAcc'+oldAcc.phone);
        //newAcc.phone = oldAcc.phone;
        newAcc = oldAcc;
        system.debug('newAcc'+newAcc.phone);
        myList.add(newAcc);
    }
    
}