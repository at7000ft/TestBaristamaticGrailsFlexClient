/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - DrinkDto.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_DrinkDto extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("com.baristamatic.dto.DrinkDto") == null)
            {
                flash.net.registerClassAlias("com.baristamatic.dto.DrinkDto", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("com.baristamatic.dto.DrinkDto", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _DrinkDtoEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_recipe : ArrayCollection;
    private var _internal_number : int;
    private var _internal_displayName : String;
    private var _internal_inStock : Boolean;
    private var _internal_cost : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_DrinkDto()
    {
        _model = new _DrinkDtoEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get recipe() : ArrayCollection
    {
        return _internal_recipe;
    }

    [Bindable(event="propertyChange")]
    public function get number() : int
    {
        return _internal_number;
    }

    [Bindable(event="propertyChange")]
    public function get displayName() : String
    {
        return _internal_displayName;
    }

    [Bindable(event="propertyChange")]
    public function get inStock() : Boolean
    {
        return _internal_inStock;
    }

    [Bindable(event="propertyChange")]
    public function get cost() : String
    {
        return _internal_cost;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set recipe(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_recipe;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_recipe = value;
            }
            else if (value is Array)
            {
                _internal_recipe = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_recipe = null;
            }
            else
            {
                throw new Error("value of recipe must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "recipe", oldValue, _internal_recipe));
        }
    }

    public function set number(value:int) : void
    {
        var oldValue:int = _internal_number;
        if (oldValue !== value)
        {
            _internal_number = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "number", oldValue, _internal_number));
        }
    }

    public function set displayName(value:String) : void
    {
        var oldValue:String = _internal_displayName;
        if (oldValue !== value)
        {
            _internal_displayName = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "displayName", oldValue, _internal_displayName));
        }
    }

    public function set inStock(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_inStock;
        if (oldValue !== value)
        {
            _internal_inStock = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "inStock", oldValue, _internal_inStock));
        }
    }

    public function set cost(value:String) : void
    {
        var oldValue:String = _internal_cost;
        if (oldValue !== value)
        {
            _internal_cost = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "cost", oldValue, _internal_cost));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _DrinkDtoEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _DrinkDtoEntityMetadata) : void
    {
        var oldValue : _DrinkDtoEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }


}

}
