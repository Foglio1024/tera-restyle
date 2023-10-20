class g4.component.TextButton extends g4.component.G4Button
{
   static var ROLL_OVER = "rollOver";
   static var ROLL_OUT = "rollOut";
   static var CLICK = "click";
   var soundID = 0;
   var isHtml = false;
   var verticalAlign = "center";
   var textAlign = "center";
   var textAutoSize = "shrink";
   var fontSize = -1;
   function TextButton()
   {
      super();
   }
   function updateAfterStateChange()
   {
      if(!this.initialized)
      {
         return undefined;
      }
      this.validateNow();
      if(this.textField != null && this._label != null)
      {
         if(this.isHtml)
         {
            this.textField.html = true;
            this.textField.htmlText = this._label;
         }
         else
         {
            this.textField.html = false;
            this.textField.text = this._label;
         }
         this.textField.verticalAlign = this.verticalAlign;
         this.textField.textAutoSize = this.textAutoSize;
         var _loc2_ = this.textField.getTextFormat();
         _loc2_.align = this.textAlign;
         if(this.fontSize != -1)
         {
            _loc2_.size = this.fontSize;
         }
         this.textField.setTextFormat(_loc2_);
      }
      if(this.constraints != null)
      {
         this.constraints.update(this.__get__width(),this.__get__height());
      }
      this.dispatchEvent(gfx.events.EventTypes.STATE_CHANGE,[this.state]);
   }
}
