({
	passValueToParentComponent : function(component, event, helper) {
		console.log("hii");
        var evt=component.getEvent("eventExample");
        evt.setParams({"message":"I am child parent"})
        evt.fire();
	}
})