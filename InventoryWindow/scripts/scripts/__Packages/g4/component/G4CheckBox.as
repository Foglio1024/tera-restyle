class g4.component.G4CheckBox extends g4.component.G4Button
{
   var isInteractionToggle = true;
   function G4CheckBox()
   {
      super();
   }
   function toString()
   {
      return "[Scaleform G4CheckBox " + this._name + "]";
   }
   function configUI()
   {
      super.configUI();
      this.toggle = true;
   }
   function handleClick(mouseIndex, button)
   {
      if(this.useHandCursor == false)
      {
         return undefined;
      }
      if(this.toggle && this.isInteractionToggle == true)
      {
         this.__set__selected(!this._selected);
      }
      if(this.__get__selected() == true)
      {
         lib.manager.UISound.play(lib.manager.UISound.CHECKBTN_CHECK);
      }
      else
      {
         lib.manager.UISound.play(lib.manager.UISound.CHECKBTN_UNCHECK);
      }
      this.dispatchEvent(gfx.events.EventTypes.CLICK,[this,mouseIndex,button]);
   }
}
