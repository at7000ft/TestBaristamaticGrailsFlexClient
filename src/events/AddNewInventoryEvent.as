package events
{
	import domain.InventoryEntry;
	
	import flash.events.Event;
	
	public class AddNewInventoryEvent extends Event
	{
		public var inventoryEntry:InventoryEntry;
		
		public function AddNewInventoryEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}