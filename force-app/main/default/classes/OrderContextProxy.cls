public with sharing class OrderContextProxy implements IOrderContext{
    Order currentOrder;
    OrderContext context;
    public OrderContextProxy(Order currentOrder) {
        this.currentOrder = currentOrder;
    }

    public void sendOrder() {
        if (this.context == null) {
            this.context = new OrderContext(this.currentOrder);
        }
        this.context.sendOrder();
    }

    public void printOrder() {
        if (this.context == null) {
            this.context = new OrderContext(this.currentOrder);
        }
        this.context.printOrder();
    }
}
