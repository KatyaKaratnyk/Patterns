({
    doSend : function(component) {
        let recordId = component.get("v.recordId");
        let action = component.get("c.sendOrder");
        
        action.setParams({
            orderId: recordId
        });

        action.setCallback(this, function (response) {
            let state = response.getState();
            let resp = response.getReturnValue();
            if (state == "SUCCESS") {
                this.fireToast("success", "Order was sent succesfully");
            } else {
                this.fireToast("error", "Order wasn`t sent");
            }
            component.set("v.loadingInProgress", false);
        });

        $A.enqueueAction(action);
    },

    doCancel: function (component) {
        $A.get("e.force:closeQuickAction").fire();
    },

    fireToast: function (type, message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            mode: "dismisable",
            message: message,
            type: type,
            duration: 5000
        });
        toastEvent.fire();
    },
})
