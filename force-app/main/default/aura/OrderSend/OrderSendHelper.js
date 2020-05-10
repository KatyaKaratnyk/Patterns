({
    doSend : function() {

    },

    doCancel: function (component) {
        $A.get("e.force:closeQuickAction").fire();
    },
})
