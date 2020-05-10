public with sharing class OrderController {
    public static OrderService service = new OrderService();
    
    @AuraEnabled
    public static void sendOrder(Id orderId) {
        Order currentOrder = service.getOrderById(orderId);
        //this method works using State Pattern and Proxy Pattern
        service.send(currentOrder);
    }

    //This method save our order in some external data
    @AuraEnabled
    public static void saveOrder(Id orderId) {
        Order currentOrder = service.getOrderById(orderId);
        //this method works using Adapter Pattern
        service.save(currentOrder);
    }
}
