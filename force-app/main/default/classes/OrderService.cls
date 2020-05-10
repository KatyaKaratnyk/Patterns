public with sharing class OrderService {
    IOrderContext context;
    OrderAdapter adapter;
    Order currentOrder;
    public OrderService(Order currentOrder) {
        //Here we use proxy, whereas initialize of OrderContext is too hard, so we initialize this class when we really need it
        this.currentOrder = currentOrder;
        this.context = new OrderContextProxy(this.currentOrder);
        this.adapter = new OrderAdapter();
    }

    public void send() {
        context.sendOrder();
    }

    //This method save our order in some external data base
    public void save() {
        adapter.saveOrder(this.currentOrder);
    }
}
