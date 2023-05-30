// @isTest

// public class testTriggerOpportunity {

//   @testSetup 
//   static void makeData(){
//     Contact testContact = new contact (lastName= 'theTester' , LastClosedOppDate__c=null);
//        insert testContact;
    
//     Account testAccount = new Account (Name= 'ttttt');
//     Opportunity testOpportunity = new Opportunity ( StageName = 'Closed Lost',
//             ContactId = testContact.Id ,
//             AccountId = testAccount.Id ,
//              Name='tt' ,
//               CloseDate=system.today());

//         insert testAccount;
//         insert testOpportunity;
//   }
//   @isTest
//   static void runTriggerTest() {
//     Opportunity testOpportunity = [SELECT Id ,stageName FROM Opportunity LIMIT 1];
//     system.debug('Opportunity before update ' +  testOpportunity);
//     Test.startTest();
//     testOpportunity.stageName = 'closed won';
//     update testOpportunity;
//     Test.stopTest();
//     system.debug('Opportunity after update ' +  testOpportunity);
//     contact testContact = [SELECT Id ,LastClosedOppDate__c FROM Contact LIMIT 1];
    
//     system.AssertEquals(
//         system.now(),
//         testContact.LastClosedOppDate__c,
//         'the trigger does not work'
//     );

//   }
// }