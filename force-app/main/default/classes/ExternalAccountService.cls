public with sharing class ExternalAccountService implements IObserver{
    private AccountService service;

    public ExternalAccountService(AccountService service) {
        this.service = service;
    }

    public void updateObserver() {
        List<Account> updatedAccounts = service.getUpdatedAccounts();
        //save accounts data at some external base
    }
}
