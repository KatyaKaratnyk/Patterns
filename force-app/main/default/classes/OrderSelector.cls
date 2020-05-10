public with sharing class OrderSelector {
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
}
