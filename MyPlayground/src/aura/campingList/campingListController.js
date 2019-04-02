({
    doInit : function (component, event, helper) {      
        var action = component.get("c.getItems");       
        action.setCallback(this,function (response) {       	
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var campingItems = response.getReturnValue();
                component.set("v.items", campingItems);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });      
        $A.enqueueAction(action);       
    },    
    
    clickCreateItem: function(component, event, helper) {
        var validExpense = component.find('itemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense){
            // Create the new item
            var newCampingItem = component.get("v.newItem");
            console.log("Create item: " + JSON.stringify(newCampingItem));
            
            helper.createItem(component, newCampingItem);
            
        }
    }
})