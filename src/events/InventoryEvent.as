package events
{
	import domain.InventoryEntry;
	
	import flash.events.Event;
	
	public class InventoryEvent extends Event
	{
		public var inventoryEntry:InventoryEntry;
		
		public function InventoryEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}