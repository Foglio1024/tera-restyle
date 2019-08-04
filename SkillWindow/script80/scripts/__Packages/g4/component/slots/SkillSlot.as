class g4.component.slots.SkillSlot extends g4.component.slots.BasicSlot
{
   function SkillSlot()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this._tf_num = this.tf_num;
      this._mc_disable = this.mc_disable;
      this._iconContainer = this.createEmptyMovieClip("iconContainer",1);
      if(this._skillSlotP != null)
      {
         this.setData(this._skillSlotP);
         this.updateSlot();
      }
   }
   function setData(data)
   {
      this._skillSlotP = (g4.gameInterface.dataP.SkillSlotP)data;
      if(this._isConfigUIComplete == false)
      {
         return undefined;
      }
      super.setData(data);
   }
   function updateSlot()
   {
      if(this._isConfigUIComplete == false)
      {
         return undefined;
      }
      super.updateSlot();
      this._visible = true;
      if(this._iconContainer.imgPath !== this._skillSlotP.Img)
      {
         var _loc3_ = flash.display.BitmapData.loadBitmap(this._skillSlotP.Img);
         this._iconContainer.clear();
         lib.display.DrawBitmapData.draw(this._iconContainer,_loc3_,0,0,0,0,54,54,0.84375);
         this._iconContainer.imgPath = this._skillSlotP.Img;
      }
      if(this._skillSlotP.Num != undefined && this._skillSlotP.Num != "" && this._skillSlotP.Num != "-1")
      {
         this._tf_num.text = String(this._skillSlotP.Num);
      }
      else
      {
         this._tf_num.text = "";
      }
      this._mc_disable._visible = this._skillSlotP.Disable;
      this._mc_disable.swapDepths(this.getNextHighestDepth());
   }
}
