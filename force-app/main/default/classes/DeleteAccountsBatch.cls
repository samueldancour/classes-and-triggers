global class DeleteAccountsBatch implements Database.Batchable<sObject>{

    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id, Name FROM Account WHERE Id NOT IN (SELECT AccountId FROM Opportunity)';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Account> scope){
        system.debug('fffffffff'+scope);
       delete scope;
    }
    public void finish(Database.BatchableContext bc){
    }
}
