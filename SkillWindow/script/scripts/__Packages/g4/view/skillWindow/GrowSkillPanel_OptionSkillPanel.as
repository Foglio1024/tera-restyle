class g4.view.skillWindow.GrowSkillPanel_OptionSkillPanel extends gfx.core.UIComponent
{
   function GrowSkillPanel_OptionSkillPanel()
   {
      super();
      g4.view.skillWindow.SkillWindowController.getInstance().registerGrowSkillPanel_OptionSkillPanel(this);
   }
   function configUI()
   {
      this._optionBtns = [];
      var _loc3_ = 0;
      while(_loc3_ < 3)
      {
         var _loc2_ = this["optionBtn" + _loc3_];
         _loc2_.soundID = 2089;
         _loc2_.addEventListener(gfx.events.EventTypes.CLICK,this,this.onOptionBtnClick);
         this._optionBtns.push(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function showGrowSkillDetailOptionSkills($growSkillOptionSlots)
   {
      if($growSkillOptionSlots == null || $growSkillOptionSlots == "")
      {
         this._visible = false;
         return undefined;
      }
      this._visible = true;
      var _loc4_ = 0;
      while(_loc4_ < 3)
      {
         var _loc3_ = $growSkillOptionSlots[_loc4_];
         var _loc2_ = this._optionBtns[_loc4_];
         var _loc5_ = _loc2_.iconContainer;
         _loc2_.mc_lock._visible = _loc3_.IsLock;
         _loc2_.data = _loc3_;
         _loc5_.clear();
         var _loc6_ = 0.78125;
         lib.display.DrawBitmapData.draw(_loc5_,flash.display.BitmapData.loadBitmap(_loc3_.IconPath),0,0,0,0,50,50,_loc6_,_loc6_);
         g4.manager.TooltipManager.getInstance().removeTooltip(_loc2_);
         g4.manager.TooltipManager.getInstance().addUiTooltip(g4.view.ViewID.SKILL_WINDOW,_loc2_,_loc3_.Id,0);
         _loc4_ = _loc4_ + 1;
      }
   }
   function showGrowSkillDetailOptionSkillSelected(selectedIndex)
   {
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         var _loc3_ = this._optionBtns[_loc2_];
         _loc3_.__set__selected(_loc2_ == selectedIndex);
         _loc2_ = _loc2_ + 1;
      }
   }
   function showSkillEffect($slotIndex)
   {
      var _loc2_ = this._optionBtns[$slotIndex];
      var _loc3_ = _loc2_.mc_effect;
      _loc3_.gotoAndPlay(2);
      lib.manager.UISound.play(2063);
   }
   function onOptionBtnClick(optionBtn)
   {
      var _loc1_ = (g4.gameInterface.dataP.skillWindow.GrowSkillOptionSlotP)optionBtn.data;
      g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_SelectGrowSkillOptionSkill(_loc1_.Id);
   }
}
