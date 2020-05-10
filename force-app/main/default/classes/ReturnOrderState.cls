public with sharing class ReturnOrderState implements OrderState{
    public void send(Id orderId) {
        List<OrderItem> orderItems = [SELECT Id, Quantity, Product2Id, OrderId FROM OrderItem WHERE OrderId = :orderId];
        Map<Id, Decimal> product2ToId = new Map<Id, Decimal>();
        for (OrderItem item: orderItems) {
            product2ToId.put(item.Product2Id, item.Quantity);
        }

        List<ProductItem> productItems = [
            SELECT Id, QuantityOnHand, Product2Id 
            FROM ProductItem 
            WHERE Product2Id IN : product2ToId.keySet()
            ];
    
        for (ProductItem prItem: productItems) {
            prItem.QuantityOnHand = prItem.QuantityOnHand - product2ToId.get(prItem.Product2Id);
        } 
        
        update productItems;
    }

    public void print(Id orderId) {
        //generate pdf file for Return Order
    }
}
