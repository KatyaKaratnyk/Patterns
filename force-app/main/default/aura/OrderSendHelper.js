({
    sendOrder : function(component, event, helper) {
        var action = component.get('c.getOrders');
        var overbillId = component.get('v.recordId');
        action.setParams({
            accountId: overbillId
        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //console.log('1' + Date().toString());
                component.set('v.orders', response.getReturnValue());
            } else {
                component.set('v.orders', null);
                console.log("Failed with state:" + response.getError()[0].message);
            }
            $A.util.addClass(spinner, "slds-hide");
            //console.log('2' + Date().toString());
        });
        $A.enqueueAction(action);
    }
})