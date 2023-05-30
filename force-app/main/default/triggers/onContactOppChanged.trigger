trigger onContactOppChanged on Opportunity (before update) {
        List<Opportunity> opps = Trigger.new;
        Map<Id, Opportunity> oldOpps = Trigger.oldMap;
        Set<Id> contactsIdsToUpdate = new Set<Id>();
    
        for(Opportunity opp : opps) {
            // system.debug(opp.StageName);
            // system.debug(oldOpps.get(opp.Id).StageName);
            if(opp.StageName != oldOpps.get(opp.Id).StageName) {
                // system.debug(opp.Contact__c);
                if(opp.Contact__c != null && opp.StageName == 'Closed Won') {
                    contactsIdsToUpdate.add(opp.contact__c);
                }
            }
        }
        // system.debug(contactsIdsToUpdate.size());
        List<Contact> contactsToUpdate = [SELECT Id FROM Contact WHERE Id IN :contactsIdsToUpdate];
        // system.debug(contactsToUpdate);
        for(Contact con : contactsToUpdate) {
            con.LastClosedOppDate__c = system.now();
        }
    
        update contactsToUpdate;
    }
    