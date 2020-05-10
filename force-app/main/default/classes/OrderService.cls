public with sharing class OrderService {
    public Order getOrderById(Id orderId) {
        List<Order> orders = [
            SELECT Id, Name, Type 
            FROM Order
            WHERE Id = :orderId
        ];
        if (!orders.isEmpty()) {
            return orders.get(0);
        }

        return null;
    }

    public void send(Order currentOrder) {
        IOrderContext context = new OrderContextProxy(currentOrder);
        context.sendOrder();
    }

    //This method save our order in some external data
    public void save(Order currentOrder) {
        OrderAdapter adapter = new OrderAdapter();
        adapter.saveOrder(currentOrder);
    }
}
