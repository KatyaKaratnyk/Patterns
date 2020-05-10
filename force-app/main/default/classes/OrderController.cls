public with sharing class OrderController {
    public static OrderService service = new OrderService();
    
    @AuraEnabled
    public static void sendOrder(Id orderId) {
        Order currentOrder = service.getOrderById(orderId);
        //this method works using State Pattern
        service.send(currentOrder);
    }

    @AuraEnabled
    public static void saveOrder(Id orderId) {
        Order currentOrder = service.getOrderById(orderId);
        //this method works using Adapter Pattern
        service.save(currentOrder);
    }
}
