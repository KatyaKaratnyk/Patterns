public with sharing class OrderController {
    
    @AuraEnabled
    public static void sendOrder(Id orderId) {
        Order currentOrder = new OrderSelector().getOrderById(orderId);
        OrderService service = new OrderService(currentOrder);
        //this method works using State Pattern and Proxy Pattern
        service.send();
    }

    //This method save our order in some external data
    @AuraEnabled
    public static void saveOrder(Id orderId) {
        Order currentOrder = new OrderSelector().getOrderById(orderId);
        OrderService service = new OrderService(currentOrder);
    
        //this method works using Adapter Pattern
        service.save();
    }
}
