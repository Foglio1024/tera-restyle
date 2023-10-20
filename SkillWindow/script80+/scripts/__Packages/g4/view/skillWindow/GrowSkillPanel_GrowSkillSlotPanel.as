class g4.view.skillWindow.GrowSkillPanel_GrowSkillSlotPanel extends gfx.core.UIComponent
{
   function GrowSkillPanel_GrowSkillSlotPanel()
   {
      super();
   }
   function configUI()
   {
      this._mc_modalBg = this.mc_modalBg;
      this._optionSkillGroup = this.optionSkillGroup;
      this._growSkillSlot = [];
      var _loc2_ = 0;
      while(_loc2_ < 5)
      {
         var _loc4_ = this["growSkillSlot" + _loc2_];
         var _loc3_ = this._optionSkillGroup["optionBtn" + _loc2_];
         _loc3_.addEventListener(gfx.events.EventTypes.CLICK,this,this.onOptionBtnClick);
         this._growSkillSlot.push(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      this._mc_modalBg.onRelease = g4.util.Delegate.create(this,this.onModalBgClick);
      this._mc_modalBg._visible = false;
      this._mc_modalBg.useHandCursor = false;
      this._optionSkillGroup._visible = false;
   }
   function showGrowSkillSlots(growSkillSlotPs)
   {
      var _loc2_ = 0;
      while(_loc2_ < 5)
      {
         var _loc3_ = this._growSkillSlot[_loc2_];
         var _loc4_ = growSkillSlotPs[_loc2_];
         if(_loc4_ != null)
         {
            _loc3_.setData(_loc4_);
            _loc3_.showGrowSkillSlot();
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function showGrowSkillSlotSelected(selectedIndex)
   {
      var _loc3_ = 0;
      while(_loc3_ < 5)
      {
         var _loc2_ = this._growSkillSlot[_loc3_];
         if(_loc3_ == selectedIndex)
         {
            _loc2_.__set__selected(true);
            _loc2_.__set__mouseEnabled(false);
         }
         else
         {
            _loc2_.__set__selected(false);
            _loc2_.__set__mouseEnabled(true);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function showGrowSkillOptionSlots($index, $growSkillOptionSlots, $selectedIndex)
   {
      if($index == -1)
      {
         this._mc_modalBg._visible = false;
         this._optionSkillGroup._visible = false;
      }
      else
      {
         this._mc_modalBg._visible = true;
         this._optionSkillGroup._visible = true;
         var _loc2_ = 0;
         while(_loc2_ < 3)
         {
            var _loc5_ = this._optionSkillGroup["optionBtn" + _loc2_].iconContainer;
            var _loc4_ = $growSkillOptionSlots[_loc2_];
            var _loc3_ = this._optionSkillGroup["optionBtn" + _loc2_];
            _loc3_.soundID = 2089;
            _loc3_.mc_lock._visible = _loc4_.IsLock;
            _loc3_.data = _loc4_;
            if(_loc2_ == $selectedIndex)
            {
               _loc3_.__set__selected(true);
            }
            else
            {
               _loc3_.__set__selected(false);
            }
            _loc5_.clear();
            var _loc6_ = 0.5;
            lib.display.DrawBitmapData.draw(_loc5_,flash.display.BitmapData.loadBitmap(_loc4_.IconPath),0,0,0,0,32,32,_loc6_,_loc6_);
            _loc2_ = _loc2_ + 1;
         }
         this._optionSkillGroup._y = 40 + 85 * $index;
      }
   }
   function showGrowSkillSlotEffect($slotIndex)
   {
      var _loc2_ = this._growSkillSlot[$slotIndex];
      _loc2_.showGrowSkillSlotEffect();
   }
   function onOptionBtnClick(optionBtn)
   {
      var _loc1_ = (g4.gameInterface.dataP.skillWindow.GrowSkillOptionSlotP)optionBtn.data;
      g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_SelectGrowSkillOptionSkill(_loc1_.Id);
   }
   function onModalBgClick()
   {
      lib.manager.UISound.play(lib.manager.UISound.UI_CLOSE);
      this.showGrowSkillOptionSlots(-1);
   }
}
