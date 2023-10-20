class g4.view.skillWindow.SkillWindowController implements g4.gameInterface.ISkillWindow
{
   function SkillWindowController()
   {
   }
   static function getInstance()
   {
      return g4.view.skillWindow.SkillWindowController._instance = g4.view.skillWindow.SkillWindowController._instance != null?g4.view.skillWindow.SkillWindowController._instance:new g4.view.skillWindow.SkillWindowController();
   }
   function registerSkillWindow(skillWindow)
   {
      this._skillWindow = skillWindow;
   }
   function registerGrowSkillPanel_EnhancePanel(growSkillPanel_EnhancePanel)
   {
      this._growSkillPanel_EnhancePanel = growSkillPanel_EnhancePanel;
   }
   function registerTotalViewPanel(totalViewPanel)
   {
      this._totalViewPanel = totalViewPanel;
   }
   function registerDefaultViewPanel(defaultViewPanel)
   {
      this._defaultViewPanel = defaultViewPanel;
   }
   function registerGrowSkillPanel(growSkillPanel)
   {
      this._growSkillPanel = growSkillPanel;
   }
   function registerGrowSkillPanel_MaterialPanel(growSkillPanel_MaterialPanel)
   {
      this._growSkillPanel_MaterialPanel = growSkillPanel_MaterialPanel;
   }
   function registerGrowSkillPanel_DetailPanel(growSkillPanel_DetailPanel)
   {
      this._growSkillPanel_DetailPanel = growSkillPanel_DetailPanel;
   }
   function registerGrowSkillPanel_OptionSkillPanel(growSkillPanel_OptionSkillPanel)
   {
      this._growSkillPanel_OptionSkillPanel = growSkillPanel_OptionSkillPanel;
   }
   function registerGameInterfaces(registerGameInterface)
   {
      registerGameInterface("OnGameEventShowWindow",g4.util.Delegate.create(this,this.OnGameEventShowWindow));
      registerGameInterface("OnGameEventChangeUIMode",g4.util.Delegate.create(this,this.OnGameEventChangeUIMode));
      registerGameInterface("OnGame_SkillWindow_SetCrestSaveBtn",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetCrestSaveBtn));
      registerGameInterface("OnGame_SkillWindow_SetTab",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetTab));
      registerGameInterface("OnGame_SkillWindow_SetGuideText",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGuideText));
      registerGameInterface("OnGame_SkillWindow_SetViewMode",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetViewMode));
      registerGameInterface("OnGame_SkillWindow_SetSkill",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetSkill));
      registerGameInterface("OnGame_SkillWindow_SetCrest",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetCrest));
      registerGameInterface("OnGame_SkillWindow_CoolTime",g4.util.Delegate.create(this,this.OnGame_SkillWindow_CoolTime));
      registerGameInterface("OnGame_SkillWindow_SetToggle",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetToggle));
      registerGameInterface("OnGame_SkillWindow_SetTitleText",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetTitleText));
      registerGameInterface("OnGame_SkillWindow_SetPathSkill",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetPathSkill));
      registerGameInterface("OnGame_SkillWindow_SetDefaultText",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetDefaultText));
      registerGameInterface("OnGame_SkillWindow_SetSkillInfo",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetSkillInfo));
      registerGameInterface("OnGame_SkillWindow_SetPage",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetPage));
      registerGameInterface("OnGame_MouseDown",g4.util.Delegate.create(this,this.OnGame_MouseDown));
      registerGameInterface("OnGame_MouseUp",g4.util.Delegate.create(this,this.OnGame_MouseUp));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillSlots",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillSlots));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillSlotSelected",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillSlotSelected));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillDetailSlotInfo",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillDetailSlotInfo));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillDetailEnhance",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillDetailEnhance));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillDetailOptionSkills",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillDetailOptionSkills));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillDetailOptionSkillEffectDesc",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillDetailOptionSkillEffectDesc));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillDetailMaterialGroup",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillDetailMaterialGroup));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillCompleteEffect",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillCompleteEffect));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillFunctionButton",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillFunctionButton));
      registerGameInterface("OnGame_SkillWindow_SetSkillPointExp",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetSkillPointExp));
      registerGameInterface("OnGame_SkillWindow_SetSkillPoint",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetSkillPoint));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillOptionSlots",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillOptionSlots));
      registerGameInterface("OnGame_SkillWindow_SetGrowSkillDetailOptionSkillSelected",g4.util.Delegate.create(this,this.OnGame_SkillWindow_SetGrowSkillDetailOptionSkillSelected));
      registerGameInterface("OnGame_SkillWindow_ShowEnhanceSkillEffect",g4.util.Delegate.create(this,this.OnGame_SkillWindow_ShowEnhanceSkillEffect));
      registerGameInterface("OnGame_SkillWindow_ShowOptionSkillEffect",g4.util.Delegate.create(this,this.OnGame_SkillWindow_ShowOptionSkillEffect));
   }
   function OnGameEventShowWindow(widgetName, bShow)
   {
      this._skillWindow.OnGameEventShowWindow(widgetName,bShow);
   }
   function OnGameEventChangeUIMode(bShow)
   {
      this._skillWindow.OnGameEventChangeUIMode(bShow);
   }
   function OnGame_SkillWindow_SetCrestSaveBtn(btnParam)
   {
      this._skillWindow.OnGame_SkillWindow_SetCrestSaveBtn(btnParam);
   }
   function OnGame_SkillWindow_SetTab($tabNames, $tagNums, $isAvtices, $selectedTab, $tooltipMessages)
   {
      var _loc5_ = g4.util.TeraParser.parse($tabNames);
      var _loc3_ = g4.util.TeraParser.parse($tagNums);
      var _loc4_ = g4.util.TeraParser.parse($isAvtices);
      var _loc6_ = g4.util.TeraParser.parse($tooltipMessages);
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc3_[_loc2_] = Number(_loc3_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         _loc4_[_loc2_] = Number(_loc4_[_loc2_]) == 1;
         _loc2_ = _loc2_ + 1;
      }
      this._skillWindow.OnGame_SkillWindow_SetTab(_loc5_,_loc3_,_loc4_,$selectedTab,_loc6_);
   }
   function OnGame_SkillWindow_SetGuideText(guideText)
   {
      this._skillWindow.OnGame_SkillWindow_SetGuideText(guideText);
   }
   function OnGame_SkillWindow_SetViewMode(viewMode)
   {
      this._skillWindow.OnGame_SkillWindow_SetViewMode(viewMode);
   }
   function OnGame_SkillWindow_SetSkill(skillData, selectedSlot)
   {
      this._skillWindow.OnGame_SkillWindow_SetSkill(skillData,selectedSlot);
   }
   function OnGame_SkillWindow_SetCrest(crestData, current, total)
   {
      this._skillWindow.OnGame_SkillWindow_SetCrest(crestData,current,total);
   }
   function OnGame_SkillWindow_CoolTime(slotIndex, remain, total)
   {
      this._skillWindow.OnGame_SkillWindow_CoolTime(slotIndex,remain,total);
   }
   function OnGame_SkillWindow_SetToggle(slotIndex, bTrue)
   {
      this._skillWindow.OnGame_SkillWindow_SetToggle(slotIndex,bTrue);
   }
   function OnGame_SkillWindow_SetTitleText(title_0, title_1, title_2)
   {
      this._defaultViewPanel.setTitleText(title_0,title_1,title_2);
   }
   function OnGame_SkillWindow_SetPathSkill(pathSkillId, pathSkillName, pathSkillImg, pathSkillCheck, pathSkillTime)
   {
      if(pathSkillId == undefined || pathSkillId == "" || pathSkillId == "undefined" || pathSkillId == null)
      {
         this._defaultViewPanel.clearPathSkill(false);
         return undefined;
      }
      this._defaultViewPanel.setPathSkill(pathSkillId,pathSkillName,pathSkillImg,pathSkillCheck,pathSkillTime);
   }
   function OnGame_SkillWindow_SetDefaultText(defaultText)
   {
      this._defaultViewPanel.setDefaultText(defaultText);
      this._defaultViewPanel.clearPathSkill();
   }
   function OnGame_SkillWindow_SetSkillInfo(skillId, skillName, skillImg, bActive, skillInfo, bPath, bBtn)
   {
      this._defaultViewPanel.setSkillInfo(skillId,skillName,skillImg,bActive,skillInfo,bPath,bBtn);
   }
   function OnGame_SkillWindow_SetPage(curPage, maxPage)
   {
      this._totalViewPanel.setPage(Number(curPage),Number(maxPage));
   }
   function OnGame_MouseDown(button, target)
   {
      this._skillWindow.OnGame_MouseDown(button,target);
   }
   function OnGame_MouseUp(button, target)
   {
      this._skillWindow.OnGame_MouseUp(button,target);
   }
   function ToGame_SkillWindow_Init()
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_Init");
   }
   function ToGame_SkillWindow_PopUp()
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_PopUp",this._defaultViewPanel.__get__popUpFocus());
   }
   function ToGame_SkillWindow_CloseUI()
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_CloseUI");
   }
   function ToGame_SkillWindow_SelectTab(index, noRequestEvent)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_SelectTab",index);
   }
   function ToGame_SkillWindow_ChangeCrestSaveBtn(index)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_ChangeCrestSaveBtn",index);
   }
   function ToGame_SkillWindow_ChangeViewMode(index)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_ChangeViewMode",index);
   }
   function ToGame_SkillWindow_Path()
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_Path");
   }
   function ToGame_SkillWindow_Reset()
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_Reset");
   }
   function ToGame_SkillWindow_Recommend()
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_Recommend");
   }
   function ToGame_SkillWindow_ChangeCrestState(targetCrest)
   {
      var _loc2_ = targetCrest.slotIndex;
      var _loc6_ = targetCrest.crestIndex;
      var _loc3_ = targetCrest.crestId;
      var _loc7_ = targetCrest.crestRealId;
      var _loc4_ = targetCrest.crestState;
      var _loc5_ = _loc2_ + "\t" + _loc6_ + "\t" + _loc3_ + "\t" + _loc7_ + "\t" + _loc4_;
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_ChangeCrestState",_loc5_);
   }
   function ToGame_SkillWindow_UseSlot(slotIndex, index)
   {
      var _loc1_ = slotIndex + "\t" + index;
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_UseSlot",_loc1_);
   }
   function ToGame_SkillWindow_ChangePathTime(timeText)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_ChangePathTime",timeText);
   }
   function ToGame_SkillWindow_RequestSetPage(page)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_RequestSetPage",page);
   }
   function ToGame_SkillWindow_ChangePathSkillCheck(changed)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_ChangePathSkillCheck",changed);
   }
   function ToGame_SkillWindow_SelectSkill(id)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_SelectSkill",id);
   }
   function OnGame_SkillWindow_SetGrowSkillSlots(growSkillSlots)
   {
      var _loc3_ = g4.util.JSON.parse(growSkillSlots);
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc3_[_loc2_] = new g4.gameInterface.dataP.skillWindow.GrowSkillSlotP(_loc3_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this._growSkillPanel.setGrowSkillSlots(_loc3_);
   }
   function OnGame_SkillWindow_SetGrowSkillSlotSelected(selectedIndex)
   {
      this._growSkillPanel.showGrowSkillSlotSelected(selectedIndex);
   }
   function OnGame_SkillWindow_SetGrowSkillDetailSlotInfo(skillSlot, currentEnhance, maxEnhance, cautionMessage, desc)
   {
      if(skillSlot != "")
      {
         var _loc2_ = new g4.gameInterface.dataP.SkillSlotP(g4.util.JSON.parse(skillSlot));
         this._growSkillPanel_DetailPanel.showGrowSkillDetailSlotInfo(_loc2_,currentEnhance,maxEnhance,cautionMessage);
         this._growSkillPanel_DetailPanel._visible = true;
         this._growSkillPanel.hideBlankPanel();
      }
      else
      {
         this._growSkillPanel_DetailPanel._visible = false;
         this._growSkillPanel.showBlankPanel(desc);
      }
   }
   function OnGame_SkillWindow_SetGrowSkillDetailEnhance(currentLevel, nextLevel, $abilityNames, $currentValues, $nextValues)
   {
      var _loc4_ = g4.util.JSON.parse($abilityNames);
      var _loc2_ = g4.util.JSON.parse($currentValues);
      var _loc3_ = g4.util.JSON.parse($nextValues);
      this._isOptionSkill = false;
      this._growSkillPanel_EnhancePanel.showGrowSkillDetailEnhance(currentLevel,nextLevel);
      this._growSkillPanel_MaterialPanel.showGrowSkillDetailEnhance(_loc4_,_loc2_,_loc3_);
      this._growSkillPanel_OptionSkillPanel._visible = false;
      this._growSkillPanel_EnhancePanel._visible = true;
      this._growSkillPanel_MaterialPanel.moveArrow(1);
      this._growSkillPanel_MaterialPanel._visible = true;
   }
   function OnGame_SkillWindow_SetGrowSkillDetailOptionSkills($growSkillOptionSlots)
   {
      this._isOptionSkill = true;
      var _loc3_ = g4.util.JSON.parse($growSkillOptionSlots);
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc3_[_loc2_] = new g4.gameInterface.dataP.skillWindow.GrowSkillOptionSlotP(_loc3_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this._growSkillPanel_OptionSkillPanel.showGrowSkillDetailOptionSkills(_loc3_);
      this._growSkillPanel_OptionSkillPanel._visible = true;
      this._growSkillPanel_EnhancePanel._visible = false;
   }
   function OnGame_SkillWindow_SetGrowSkillDetailOptionSkillSelected(selectedIndex)
   {
      if(selectedIndex != -1)
      {
         this._growSkillPanel_MaterialPanel._visible = true;
      }
      else
      {
         this._growSkillPanel_MaterialPanel._visible = false;
      }
      this._growSkillPanel_OptionSkillPanel.showGrowSkillDetailOptionSkillSelected(selectedIndex);
      this._growSkillPanel_MaterialPanel.moveArrow(selectedIndex);
   }
   function OnGame_SkillWindow_SetGrowSkillDetailOptionSkillEffectDesc(optionSkillEffectDesc)
   {
      this._growSkillPanel_MaterialPanel.showGrowSkillDetailOptionSkillEffectDesc(optionSkillEffectDesc);
   }
   function OnGame_SkillWindow_SetGrowSkillDetailMaterialGroup(needMaterials, needGold, hasGold)
   {
      var _loc3_ = needMaterials != ""?g4.util.JSON.parse(needMaterials):null;
      this._needMaterials = _loc3_;
      this._needGold = needGold;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc3_[_loc2_] = new g4.gameInterface.dataP.skillWindow.GrowSkillDetailMaterialP(_loc3_[_loc2_]);
         (g4.gameInterface.dataP.skillWindow.GrowSkillDetailMaterialP)_loc3_[_loc2_].itemSlotP.Amount = 0;
         _loc2_ = _loc2_ + 1;
      }
      this._growSkillPanel_MaterialPanel.showGrowSkillDetailMaterialGroup(_loc3_,Number(needGold),Number(hasGold));
   }
   function OnGame_SkillWindow_SetGrowSkillCompleteEffect()
   {
   }
   function OnGame_SkillWindow_SetGrowSkillFunctionButton(buttonName, isDisable)
   {
      this._growSkillPanel_DetailPanel.showGrowSkillFunctionButton(buttonName,isDisable);
   }
   function OnGame_SkillWindow_SetSkillPointExp(currentExp, maxExp)
   {
      this._growSkillPanel.setSkillPointExp(currentExp,maxExp);
   }
   function OnGame_SkillWindow_SetSkillPoint(currentPoint, maxPoint)
   {
      this._growSkillPanel.setSkillPoint(currentPoint,maxPoint);
   }
   function OnGame_SkillWindow_SetGrowSkillOptionSlots($index, $growSkillOptionSlots, $selectedIndex)
   {
      var _loc3_ = $growSkillOptionSlots != ""?g4.util.JSON.parse($growSkillOptionSlots):null;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc3_[_loc2_] = new g4.gameInterface.dataP.skillWindow.GrowSkillOptionSlotP(_loc3_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this._growSkillPanel.showGrowSkillOptionSlots($index,_loc3_,$selectedIndex);
   }
   function OnGame_SkillWindow_ShowEnhanceSkillEffect($slotIndex)
   {
      this._growSkillPanel.showGrowSkillSlotEffect($slotIndex);
      this._growSkillPanel_EnhancePanel.showGrowSkillSlotEffect();
   }
   function OnGame_SkillWindow_ShowOptionSkillEffect($slotIndex)
   {
      this._growSkillPanel_OptionSkillPanel.showSkillEffect($slotIndex);
   }
   function ToGame_SkillWindow_SelectGrowSkill(growSkillId)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_SelectGrowSkill",growSkillId);
   }
   function ToGame_SkillWindow_SelectGrowSkillFunctionButton()
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_SelectGrowSkillFunctionButton");
   }
   function ToGame_SkillWindow_SelectGrowSkillOptionSkill(optionSkillId)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SkillWindow_SelectGrowSkillOptionSkill",optionSkillId);
   }
   function ToGame_SKillWIndow_SelectGrowSkillOptionButton(growSkillId)
   {
      g4.model.GameInterface.callGameInterface("ToGame_SKillWIndow_SelectGrowSkillOptionButton",String(growSkillId));
   }
   function showMaterialItemSlotListSimplePopup()
   {
      var _loc3_ = new g4.simplePopup.model.MaterialItemSlotListSimplePopupModel();
      var _loc7_ = undefined;
      var _loc6_ = undefined;
      if(this._isOptionSkill == true)
      {
         _loc7_ = lib.util.UIString.getUIString("$083029");
         _loc6_ = lib.util.UIString.getUIString("$083031");
      }
      else
      {
         _loc7_ = lib.util.UIString.getUIString("$083028");
         _loc6_ = lib.util.UIString.getUIString("$083030");
      }
      var _loc8_ = lib.util.GoldCurrency.SetGoldText(this._needGold,0,0,0,0);
      _loc6_ = g4.util.StringUtil.replace(_loc6_,"{gold}",_loc8_);
      _loc3_.title = _loc7_;
      _loc3_.description = _loc6_;
      _loc3_.confirmBtnName = g4.simplePopup.ButtonType.CONFIRM.getLocale();
      _loc3_.cancelBtnName = g4.simplePopup.ButtonType.CANCEL.getLocale();
      var _loc5_ = [];
      var _loc4_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this._needMaterials.length)
      {
         _loc5_.push((g4.gameInterface.dataP.skillWindow.GrowSkillDetailMaterialP)this._needMaterials[_loc2_].itemSlotP);
         _loc4_.push((g4.gameInterface.dataP.skillWindow.GrowSkillDetailMaterialP)this._needMaterials[_loc2_].NeedCount);
         _loc2_ = _loc2_ + 1;
      }
      _loc3_.itemSlotPs = _loc5_;
      _loc3_.needCounts = _loc4_;
      _loc3_.confirmCallback = g4.util.Delegate.create(this,this.onMaterialItemSlotListSimplePopupConfirm);
      g4.manager.SimplePopupManager.getInstance().showSimplePopup(g4.simplePopup.SimplePopupType.MATERIAL_ITEM_SLOT_LIST_SIMPLE_POPUP,_loc3_);
   }
   function onMaterialItemSlotListSimplePopupConfirm()
   {
      this.ToGame_SkillWindow_SelectGrowSkillFunctionButton();
      g4.manager.SimplePopupManager.getInstance().hideSimplePopup(g4.simplePopup.SimplePopupType.MATERIAL_ITEM_SLOT_LIST_SIMPLE_POPUP);
   }
}
