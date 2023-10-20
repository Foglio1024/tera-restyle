class g4.component.ButtonGroup extends g4.core.EventDispatcher
{
   var name = "buttonGroup";
   function ButtonGroup(name, scope)
   {
      super();
      this.name = name;
      this.scope = scope;
      this.children = [];
   }
   function __get__length()
   {
      return this.children.length;
   }
   function __get__data()
   {
      return this.selectedButton.data;
   }
   function addButton(button)
   {
      this.removeButton(button);
      this.children.push(button);
      if(button.__get__selected())
      {
         this.setSelectedButton(button);
      }
      button.addEventListener(gfx.events.EventTypes.SELECT,this,this.handleSelect);
      button.addEventListener(gfx.events.EventTypes.CLICK,this,this.handleClick);
   }
   function removeButton(button)
   {
      var _loc2_ = this.indexOf(button);
      if(_loc2_ > -1)
      {
         this.children.splice(_loc2_,1);
         button.removeEventListener(gfx.events.EventTypes.SELECT,this,this.handleSelect);
         button.removeEventListener(gfx.events.EventTypes.CLICK,this,this.handleClick);
      }
      if(this.selectedButton == button)
      {
         this.selectedButton = null;
      }
   }
   function indexOf(button)
   {
      var _loc4_ = this.__get__length();
      if(_loc4_ == 0)
      {
         return -1;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.__get__length())
      {
         if(this.children[_loc2_] == button)
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return -1;
   }
   function getButtonAt(index)
   {
      return this.children[index];
   }
   function toString()
   {
      return "[Scaleform g4.component.ButtonGroup " + this.name + "]";
   }
   function setSelectedButtonIndex(index)
   {
      this.setSelectedButton(this.getButtonAt(index));
   }
   function setSelectedButton(button)
   {
      if(this.selectedButton == button || this.indexOf(button) == -1 && button != null)
      {
         return undefined;
      }
      if(this.selectedButton != null && this.selectedButton._name != null)
      {
         this.selectedButton.__set__selected(false);
         (g4.component.G4Button)this.selectedButton.__set__mouseEnabled(true);
      }
      this.selectedButton = button;
      if(this.selectedButton == null)
      {
         return undefined;
      }
      this.selectedButton.__set__selected(true);
      (g4.component.G4Button)this.selectedButton.__set__mouseEnabled(false);
      this.dispatchEvent(gfx.events.EventTypes.CHANGE,[this.selectedButton]);
   }
   function getSelectedButtonIndex()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.children.length)
      {
         if(this.children[_loc2_].selected)
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function handleSelect(button)
   {
      if(button.__get__selected())
      {
         this.setSelectedButton(button);
      }
      else
      {
         this.setSelectedButton(null);
      }
   }
   function handleClick(button)
   {
      if(this._selectedButton == button)
      {
         return undefined;
      }
      this._selectedButton = button;
      this.setSelectedButton(button);
      this.dispatchEvent(gfx.events.EventTypes.ITEM_CLICK,[button]);
   }
}
