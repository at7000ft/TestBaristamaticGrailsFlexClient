package events
{
	import flash.events.Event;
	
	public class OrderEvent extends Event
	{
		public var orderDrinkNumber:int;
		
		public function OrderEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}