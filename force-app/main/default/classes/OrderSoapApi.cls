//We have some Soap Api, which save our orders in some other data base.
//This is Test Soap Api just for example;

public with sharing class OrderSoapApi {
    public class OrderExternal {
        public String orderName;
        public String orderType;
    }

    public class OrderRequest {
        public OrderExternal order;
    }

    public void saveOrder(OrderExternal order) {
        OrderSoapApi.OrderRequest request = new OrderSoapApi.OrderRequest();
        request.order = order;
        WebServiceCallout.invoke( this, request, null, null);
    }
}
