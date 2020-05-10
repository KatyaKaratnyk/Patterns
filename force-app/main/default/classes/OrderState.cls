public interface OrderState {
    void send(Id orderId);
    void print(Id orderId);
}
