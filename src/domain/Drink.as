package domain
{
	
	/*
	When we are using Remote Object, we must make sure that
	
	* All the properties are the same.
	* We have getters and setters for all properties on back the java side and the AS side.
	* We must have our AS object set as Bindable and the RemoteClass set to the path of our remote object.
	* We must make sure that the constructors match. I have seen where flex will swallow the error message if they don’t match, making debugging a pain.
 	* Sometimes cannot have any constructor
	*/
	[Bindable]
	[RemoteClass(alias="com.baristamatic.dto.DrinkDto")]
	public class Drink
	{

		private var _displayName:String;
		private var _number:int;
		private var _inStock:Boolean;
		private var _cost:Number;
		private var _recipe:ArrayCollection;
		
		public static function drinkConst(displayName:String, number:int, inStock:Boolean, cost:Number, recipe:ArrayCollection):Drink {
			var drink:Drink = new Drink();
			drink.displayName = displayName;
			drink.number = number;
			drink.inStock = inStock;
			drink.cost = cost;
			drink.recipe = recipe;
			return drink;
		}
		
 
		
 

		public function get displayName():String
		{
			return _displayName;
		}

		public function set displayName(value:String):void
		{
			_displayName = value;
		}

		public function get number():int
		{
			return _number;
		}

		public function set number(value:int):void
		{
			_number = value;
		}

		public function get inStock():Boolean
		{
			return _inStock;
		}

		public function set inStock(value:Boolean):void
		{
			_inStock = value;
		}

		public function get cost():Number
		{
			return _cost;
		}

		public function set cost(value:Number):void
		{
			_cost = value;
		}

		public function get recipe():ArrayCollection
		{
			return _recipe;
		}

		public function set recipe(value:ArrayCollection):void
		{
			_recipe = value;
		}





	}
}