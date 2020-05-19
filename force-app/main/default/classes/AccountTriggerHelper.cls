public with sharing class AccountTriggerHelper {
    
    public void someActionsWIthUpdatedAccounts() {
        AccountService service = new AccountService(Trigger.New);
        service.add(new ExternalAccountService(service));
        service.notify();
    }
}

