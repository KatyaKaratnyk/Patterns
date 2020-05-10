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
        OrderContext context = new OrderContext(currentOrder);
        context.sendOrder();
    }

    public void save(Order currentOrder) {
        OrderAdapter adapter = new OrderAdapter();
        adapter.saveOrder(currentOrder);
    }
}
