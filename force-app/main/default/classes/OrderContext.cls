public with sharing class OrderContext implements IOrderContext{
    OrderState state;
    Id orderId;
    Map<String, OrderState> orderTypeToState;
    public OrderContext(Order currentOrder) {
        this.initStates();
        this.state = orderTypeToState.get(currentOrder.Type);
        this.orderId = currentOrder.Id;
    }

    private void initStates() {
        orderTypeToState = new Map<String, OrderState>();
        orderTypeToState.put('Standard', new StandardOrderState());
        orderTypeToState.put('Return', new ReturnOrderState());
        orderTypeToState.put('Bill Only', new BillOnlyOrderState());
    }

    public void sendOrder() {
        this.state.send(this.orderId);
    }

    public void printOrder() {
        this.state.print(this.orderId);
    }

    public void setState(String orderType) {
        this.state = orderTypeToState.get(orderType);
    }
}
