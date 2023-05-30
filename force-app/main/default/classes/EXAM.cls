//1

trigger checkOrders on Order (after insert) {
    Set<Id> ordersId = new Set<Id>();
           for(Order a : trigger.new){
               ordersId.add(a.AccountId);
                        //  system.debug('fffff'+ordersId);
             }
    List<Account> AccounToUpdate = [SELECT Id , isHasOrders__c FROM Account WHERE Id IN :ordersId];
       for(Account acc : AccounToUpdate) {
                        // system.debug('befor'+acc.isHasOrders__c);
          acc.isHasOrders__c = true;
            //   system.debug('after'+acc.isHasOrders__c);
      }
  update AccounToUpdate;
}

//2

trigger checkActiveted on Order (after update) {
    // system.debug('start');
    Set<Id> ordersId = new Set<Id>();
for(Order a : trigger.new){
    if(a.Status == 'Activated'){
        ordersId.add(a.id);
    }
}
system.debug('ordersId   '+ordersId);
      List<OrderItem> OrderItemToUpdate = [SELECT Id,EndDate  FROM OrderItem WHERE OrderId IN :ordersId];
//  system.debug('OrderItemToUpdate   '+OrderItemToUpdate);
     for(OrderItem ord : OrderItemToUpdate) {
                    //   system.debug('befor   '+ord.EndDate);
        ord.EndDate = system.today();
                    //  system.debug('after  '+ord.EndDate);
    }
update OrderItemToUpdate;
}

//4
שאלה מספר אחד דרך batch

start:

 מוציא את כל החשבונות עם order 
SELECT Id, isHasOrders__c FROM Account WHERE Id IN (SELECT AccountId FROM Order)

execute:

מעדכן את כל ה IsHasOrders ל true


finish .







