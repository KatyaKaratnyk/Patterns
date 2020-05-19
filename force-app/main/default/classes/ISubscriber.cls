public interface ISubscriber {
    void add(IObserver observer);
    void remove(IObserver observer);
    void notify();
}
