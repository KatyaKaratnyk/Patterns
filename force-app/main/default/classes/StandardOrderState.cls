public with sharing class StandardOrderState implements OrderState{
    public void send(Id orderId) {
        //send email to vendor
        System.debug('Email was sent to Order');
    }

    public void print(Id orderId) {
        //generate pdf file for Standard Order
    }
}
