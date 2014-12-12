package domain
{
	[Bindable]
	[RemoteClass(alias="com.baristamatic.dto.InventoryEntryDto")]
	//[RemoteClass]
	public class InventoryEntry
	{
		
		private var _displayName:String;
		private var _cost:Number;
		private var _invCount:Number;
		
		public static function inventoryEntryConst(displayName:String, cost:Number, count:Number):InventoryEntry {
			var entry:InventoryEntry = new InventoryEntry();
	 
			entry.displayName=displayName;
			entry.cost=cost;
			entry.invCount=count;
			return entry;
		}
		
		
	 
		public function get displayName():String
		{
			return _displayName;
		}

		public function set displayName(value:String):void
		{
			_displayName = value;
		}

		public function get cost():Number
		{
			return _cost;
		}

		public function set cost(value:Number):void
		{
			_cost = value;
		}

		public function get invCount():Number
		{
			return _invCount;
		}

		public function set invCount(value:Number):void
		{
			_invCount = value;
		}


	}
}