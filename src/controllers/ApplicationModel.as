package controllers
{
	import mx.collections.ArrayCollection;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;

	public class ApplicationModel
	{
		private static var log:ILogger = LoggerFactory.getLogger("ApplicationModel");
		
		//Any change to driniklist or inventoryList  notifys the views datagrid
		private var _drinklist:ArrayCollection = new ArrayCollection();
		private var _inventorylist:ArrayCollection = new ArrayCollection();
		
		public function ApplicationModel()
		{
			super();
		}
		
		//Any destinations that bind to this variable will get an event when drinklist changes
		[Bindable]
		public function get drinklist():ArrayCollection
		{
			log.debug("drinklist: called return count - " + _drinklist.length);
			return _drinklist;
		}

		public function set drinklist(value:ArrayCollection):void
		{
			log.debug("drinklist: called with " + value);
			_drinklist.source = value.source;
			_drinklist.refresh();
		}

		[Bindable]
		public function get inventorylist():ArrayCollection
		{
			log.debug("get inventorylist: return count - " + _inventorylist.length);
			return _inventorylist;
		}

		public function set inventorylist(value:ArrayCollection):void
		{
			log.debug("set inventorylist: called with " + value);
			_inventorylist.source = value.source;
			_inventorylist.refresh();
		}


	}
}