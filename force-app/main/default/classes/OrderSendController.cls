public with sharing class OrderSendController {
    @AuraEnabled
    public static void sendOrder(Id orderId){
        OrderService service = new OrderService();
        Order currentOrder = service.getOrderById(orderId);
        service.send(currentOrder);
    }
}
