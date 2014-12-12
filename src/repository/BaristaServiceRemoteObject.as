package repository
{
 
	
	import domain.InventoryEntry;
	
	import mx.rpc.remoting.RemoteObject;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.springextensions.actionscript.core.operation.IOperation;
	import org.springextensions.actionscript.rpc.remoting.RemoteObjectService;
	
	public class BaristaServiceRemoteObject extends RemoteObjectService implements IBaristaService
	{
		private static var log:ILogger = LoggerFactory.getClassLogger(BaristaServiceRemoteObject);
		public function BaristaServiceRemoteObject(remoteObject:RemoteObject)
		{
			log.debug("const: called");
			super(remoteObject);
		}
		
		//return call("getContactsByName", name);
		public function getDrinks():IOperation
		{
			log.debug("getDrinks: called");
			//Inherited call method returns an IOperation
			return call("getDrinks");
		}
		
		public function getInventory():IOperation
		{
			log.debug("getInventory: called");
			return call("getInventory");
		}
		
		public function orderDrink(drinkNumber:int):IOperation {
			log.debug("orderDrink: called with - " + drinkNumber);
			return call("orderDrink", drinkNumber);
		}
		
		public function reStockInventory():IOperation {
			log.debug("reStockInventory: called");
			return call("reStockInventory");
		}
		
		public function addNewIngredient(inventoryEntry:InventoryEntry):IOperation {
			log.debug("addNewIngredient: called");
			return call("addNewIngredient",inventoryEntry);
		}
	}
}