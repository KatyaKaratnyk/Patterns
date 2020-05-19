public with sharing class AccountService implements ISubscriber{
    private List<IObserver> observers = new List<IObserver>();
    List<Account> updatedAccounts;

    public AccountService(List<Account> accounts) {
        this.updatedAccounts = accounts;
    }

    public void add(IObserver observer) {
        observers.add(observer);
    }

    public void remove(IObserver observer) {
        for (Integer i = 0; i < observers.size(); i++) {
            if(observers.get(i) == observer) {
                observers.remove(i);
                return;
            }
        }
    }

    public void notify() {
        for (IObserver observer: observers) {
            observer.updateObserver();
        }
    }

    public List<Account> getUpdatedAccounts() {
        return this.updatedAccounts;
    }
}
