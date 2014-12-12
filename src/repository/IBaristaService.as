package repository
{
	import domain.InventoryEntry;
	
	import org.springextensions.actionscript.core.operation.IOperation;

	public interface IBaristaService
	{
		function getDrinks():IOperation; 
		function getInventory():IOperation;
		function orderDrink(drinkNumber:int):IOperation;
		function reStockInventory():IOperation;
		function addNewIngredient(inventoryEntry:InventoryEntry):IOperation;
	}
}