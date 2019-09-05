class g4.component.G4ComboBox_0_Renderer extends gfx.controls.ListItemRenderer
{
   function G4ComboBox_0_Renderer()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this._originWidth = this._width;
      this._textField = this.textField;
      this._backBg = this.backBg;
   }
   function setData(data)
   {
      super.setData(data);
      this._data = data;
      this.updateAfterStateChange();
   }
   function updateAfterStateChange()
   {
      if(this._data == null)
      {
         this._visible = false;
         return undefined;
      }
      this._visible = true;
      var _loc2_ = (g4.component.G4ComboBox)this._parent._parent._parent;
      var _loc3_ = 0;
      if(_loc2_.__get__scrollBar().thumb._visible == true)
      {
         _loc3_ = _loc2_.__get__scrollBar()._width - 4;
      }
      this.__set__width(this._originWidth - (_loc2_.__get__originWidth() - _loc2_.__get__targetWidth()) - _loc3_);
      this.__set__disabled(this._data.disabled);
      if(this.__get__disabled() == true)
      {
         this.textField._alpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
         this.textField.textColor = lib.info.TextColor.COMBOBOX_DISABLE;
      }
      else
      {
         this.textField._alpha = 100;
         this.textField.textColor = 8435166;
      }
      this.textField.htmlText = this._data.label;
   }
}
