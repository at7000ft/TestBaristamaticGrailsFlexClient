package controllers {
   import domain.InventoryEntry;

   import events.InventoryEvent;
   import events.OrderEvent;

   import flash.events.Event;

   import mx.controls.Alert;

   import org.as3commons.lang.Assert;
   import org.as3commons.logging.ILogger;
   import org.as3commons.logging.LoggerFactory;
   import org.springextensions.actionscript.context.IApplicationContext;
   import org.springextensions.actionscript.context.IApplicationContextAware;
   import org.springextensions.actionscript.core.event.EventBus;
   import org.springextensions.actionscript.core.event.IEventBusListener;
   import org.springextensions.actionscript.core.operation.IOperation;
   import org.springextensions.actionscript.core.operation.OperationEvent;

   import repository.IBaristaService;

   /*
    *  Listens for all events on EventBus which trigger calls to Blaze service. Returned data is stored in
    *	ApplicationModel.
    * 	Singleton instance created by Spring which creates and loads BaristaService and ApplicationModel.
    *	The ApplicationModel singelton is autowired into all views needing to update data from it.
    */
   public class ApplicationController implements IEventBusListener {
      private static var log:ILogger=LoggerFactory.getLogger("ApplicationController");
      private var baristaService:IBaristaService;
      private var appModel:ApplicationModel;

      //Created by Spring, register as listener for all event on EventBus
      public function ApplicationController(baristaService:IBaristaService, appModel:ApplicationModel) {
         log.debug("const: called with  baristaService - " + baristaService);

         Assert.notNull(baristaService, "The baristaService should not be null");
         Assert.notNull(appModel, "The appModel should not be null");
         this.baristaService=baristaService;
         this.appModel=appModel;
         EventBus.addListener(this);
      }

      /* Called on all events on EventBus*/
      public function onEvent(event:Event):void {
         var operation:IOperation;
         switch (event.type) {
            case ApplicationEvents.LOAD_DRINKS:
               log.debug("ApplicationController>>onEvent: LOAD_DRINKS");
               Assert.notNull(baristaService, "The baristaService should not be null");
               loadDrinks();
               break;
            case ApplicationEvents.LOAD_INVENTORY:
               log.debug("onEvent: LOAD_INVENTORY");
               Assert.notNull(baristaService, "The baristaService should not be null");
               loadInventory();
               break;
            case ApplicationEvents.ORDER_DRINK:
               log.debug("onEvent: ORDER_DRINK - " + (event as OrderEvent).orderDrinkNumber);
               Assert.notNull(baristaService, "The baristaService should not be null");
               operation=baristaService.orderDrink((event as OrderEvent).orderDrinkNumber);
               operation.addCompleteListener(function(e:OperationEvent):void {
                  log.debug("onEvent: drink ordered");
                     //appModel.drinklist.refresh();
                     //appModel.inventorylist.refresh();
               });
               operation.addErrorListener(function(e:OperationEvent):void {
                  log.debug("onEvent: orderDrink error - " + e.error);
               });
               loadInventory();
               loadDrinks();
               break;
            case ApplicationEvents.RESTOCK_INVENTORY:
               log.debug("onEvent: RESTOCK_INVENTORY");
               Assert.notNull(baristaService, "The baristaService should not be null");
               operation=baristaService.reStockInventory();
               operation.addCompleteListener(function(e:OperationEvent):void {
                  log.debug("onEvent: restocked");
                  loadDrinks();
                  loadInventory();
               });
               operation.addErrorListener(function(e:OperationEvent):void {
                  log.debug("onEvent: restocked error - " + e.error);
               });


               break;
            case ApplicationEvents.ADD_INVENTORY_ENTRY:
               log.debug("onEvent: ADD_INVENTORY_ENTRY");
               Assert.notNull(baristaService, "The baristaService should not be null");
               var entry:InventoryEntry=(event as InventoryEvent).inventoryEntry;
               Assert.notNull(entry, "The InventoryEvent should not be null");
               operation=baristaService.addNewIngredient(entry);
               operation.addCompleteListener(function(e:OperationEvent):void {
                  log.debug("onEvent: inventory added");
               });
               operation.addErrorListener(function(e:OperationEvent):void {
                  log.debug("onEvent: inventory error - " + e.error);
                  Alert.show("Error occured adding new ingredient - " + e.error.fault.faultString, "Comm Error");
               });
               loadInventory();
               break;
         }
      }

      private function loadInventory():void {
         var operation:IOperation=baristaService.getInventory();

         operation.addCompleteListener(function(e:OperationEvent):void {
            log.debug("loadInventory: inventory loaded");
            appModel.inventorylist=e.result;
				log.debug("addCompleteListener: done");
         });
         operation.addErrorListener(function(e:OperationEvent):void {
            log.debug("onEvent: getInventory error - " + e.error);
         });
      }

      private function loadDrinks():void {
         var operation:IOperation=baristaService.getDrinks();

         operation.addCompleteListener(function(e:OperationEvent):void {
            log.debug("loadDrinks: drinks loaded");
            appModel.drinklist=e.result;
				log.debug("addCompleteListener: done");
         });
         operation.addErrorListener(function(e:OperationEvent):void {
            log.debug("onEvent: getDrinks error - " + e.error);
         });
      }
   }
}