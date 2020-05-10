public with sharing class OrderAdapter {
    OrderSoapApi orderSoap;

    public OrderAdapter() {
        this.orderSoap = new OrderSoapApi();
    }

    public void saveOrder(Order currentOrder) {
        OrderSoapApi.OrderExternal newOrder = this.orderToExternalOrder(currentOrder);
        this.orderSoap.saveOrder(newOrder);
    }

    private OrderSoapApi.OrderExternal orderToExternalOrder(Order currentOrder) {
        OrderSoapApi.OrderExternal newOrder = new OrderSoapApi.OrderExternal();
        newOrder.orderName = currentOrder.Name;
        newOrder.orderType = currentOrder.Type;
        return newOrder;
    }
}
