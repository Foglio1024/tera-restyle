class g4.view.skillWindow.DefaultViewPanel extends g4.core.SimpleView
{
   var _popUpFocus = "";
   function DefaultViewPanel($targetMovie)
   {
      super($targetMovie);
      g4.view.skillWindow.SkillWindowController.getInstance().registerDefaultViewPanel(this);
      this._titleFd_0 = $targetMovie.titleFd_0;
      this._titleFd_1 = $targetMovie.titleFd_1;
      this._titleFd_2 = $targetMovie.titleFd_2;
      this._defaultFd = $targetMovie.defaultFd;
      this._skillInfoMc = $targetMovie.skillInfoMc;
      this._pathSkillMc = $targetMovie.pathSkillMc;
      this._skillListScroll = $targetMovie.skillListScroll;
      this._skillListContainer = $targetMovie.skillListContainer;
      this._skillListMask = $targetMovie.skillListMask;
      this._skillInfoMc.textFdContainer.onScroll = function()
      {
         this._y = infoTextY - arguments[0];
      };
      var infoTextY = this._skillInfoMc.textFdContainer._y;
      this._infoScroll = this._skillInfoMc.infoScroll;
      this._infoScroll.__set__pageSize(this._skillInfoMc.textFdContainer._height);
      this._infoScroll.__set__rowHeight(30);
      this._infoScroll.__set__displaySize(this._skillInfoMc.infoMask._height);
      this._infoScroll.setWheel(this._skillInfoMc.textFdContainer);
      this._infoScroll.addListener(this._skillInfoMc.textFdContainer);
      var _loc5_ = new TextFormat();
      _loc5_.tabStops = [140,240];
      this._skillInfoMc.textFdContainer.infoFd_0.setNewTextFormat(_loc5_);
      this._skillInfoMc.textFdContainer.infoFd_1.setNewTextFormat(_loc5_);
      this._skillInfoMc.textFdContainer.infoFd_2.setNewTextFormat(_loc5_);
      this._skillInfoMc.textFdContainer.infoFd_3.setNewTextFormat(_loc5_);
      this._defaultFd.verticalAutoSize = "center";
      this._activeStr = lib.util.UIString.getUIString("$081005");
      this._passiveStr = lib.util.UIString.getUIString("$081006");
      var skillListY = this._skillListContainer._y;
      this._skillListScroll.__set__pageSize(this._skillListContainer._height);
      this._skillListScroll.__set__rowHeight(88);
      this._skillListScroll.__set__displaySize(this._skillListMask._height);
      this._skillListContainer.onScroll = function()
      {
         this._y = skillListY - arguments[0];
      };
      this._skillListScroll.setWheel(this._skillListContainer);
      this._skillListScroll.addListener(this._skillListContainer);
      this._pathSkillMc.pathSlot.slotHit.GetName = function()
      {
         return this._parent._name;
      };
      (lib.util.TxtBtn)this._skillInfoMc.btn.txtBtn.setRelease(g4.util.Delegate.create(g4.view.skillWindow.SkillWindowController.getInstance(),g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_PopUp));
   }
   function __get__popUpFocus()
   {
      return this._popUpFocus;
   }
   function __get__pathSkillMc()
   {
      return this._pathSkillMc;
   }
   function __get__skillInfoMc()
   {
      return this._skillInfoMc;
   }
   function __get__skillListScroll()
   {
      return this._skillListScroll;
   }
   function __get__skillListContainer()
   {
      return this._skillListContainer;
   }
   function clearSkillContainer()
   {
      this._skillInfoMc.btn._visible = false;
      this._skillInfoMc.infoScroll._visible = false;
      this._skillInfoMc.textFdContainer.infoFd_0.htmlText = "";
      this._skillInfoMc.textFdContainer.infoFd_1.htmlText = "";
      this._skillInfoMc.textFdContainer.infoFd_2.htmlText = "";
      this._skillInfoMc.textFdContainer.infoFd_3.htmlText = "";
      this._skillInfoMc.nameFd.htmlText = "";
      this._skillInfoMc.activeFd.htmlText = "";
      this._skillInfoMc.skillIcon.clear();
   }
   function setSkillInfo(skillId, skillName, skillImg, bActive, skillInfo, bPath, bBtn)
   {
      bActive = Number(bActive);
      bPath = Number(bPath);
      this._defaultFd._visible = false;
      this._skillInfoMc._visible = true;
      this._skillInfoMc.btn._visible = false;
      if(skillId == undefined || skillId == "undefined" || skillId == "" || skillId == null)
      {
         this._popUpFocus = "";
         this._skillInfoMc._visible = false;
         this._pathSkillMc._visible = false;
         this.clearPathSkill();
         return undefined;
      }
      this.clearPathSkill(true);
      this._skillInfoMc._visible = true;
      this._skillInfoMc.infoScroll._visible = false;
      this._skillInfoMc.infoFd._width = 305;
      this._infoScroll.__set__pageSize(0);
      this._skillInfoMc.nameFd.htmlText = skillName;
      var _loc20_ = !bActive?this._passiveStr:this._activeStr;
      var _loc19_ = !bActive?"0x80B5DE":"0xFF5A00";
      this._skillInfoMc.activeFd.htmlText = _loc20_;
      this._skillInfoMc.activeFd.textColor = _loc19_;
      var _loc22_ = lib.util.ExtString.findTag(skillInfo,"section");
      var _loc8_ = this._skillInfoMc.textFdContainer;
      var _loc7_ = 0;
      var _loc9_ = _loc8_.infoFd_0._y;
      var _loc23_ = skillInfo.indexOf("<");
      var _loc18_ = skillInfo.indexOf(">") + 1;
      var _loc24_ = skillInfo.length;
      var _loc25_ = skillInfo.substring(_loc23_,_loc18_);
      var _loc12_ = skillInfo.substring(_loc18_,_loc24_);
      this._infoScroll._visible = false;
      this._infoScroll.__set__pageSize(0);
      var _loc10_ = 0;
      var _loc4_ = 0;
      var _loc11_ = _loc22_.length;
      var _loc6_ = 0;
      while(_loc6_ < 4)
      {
         var _loc3_ = _loc8_["infoFd_" + _loc6_];
         _loc3_._width = 315;
         if(_loc6_ >= _loc11_)
         {
            _loc8_["infoFd_" + _loc6_]._visible = false;
         }
         _loc6_ = _loc6_ + 1;
      }
      _loc6_ = 0;
      while(_loc6_ < _loc11_)
      {
         _loc3_ = _loc8_["infoFd_" + _loc6_];
         _loc3_._visible = true;
         _loc3_._y = _loc9_;
         _loc3_.styleSheet = _global.toolTipStyle;
         _loc4_ = _loc12_.indexOf("<section",_loc10_ + 2);
         if(_loc4_ == undefined || _loc4_ == -1)
         {
            _loc4_ = _loc12_.length;
         }
         var _loc13_ = _loc12_.slice(_loc10_,_loc4_);
         _loc3_.htmlText = _loc13_;
         var _loc5_ = _loc3_.textHeight + 5;
         _loc3_._height = _loc5_;
         _loc9_ = _loc3_._y + _loc5_ + 10;
         _loc7_ = _loc7_ + _loc5_ + 10;
         _loc10_ = _loc4_;
         _loc6_ = _loc6_ + 1;
      }
      if(_loc7_ > 175)
      {
         _loc9_ = _loc8_.infoFd_0._y;
         _loc7_ = 0;
         _loc6_ = 0;
         while(_loc6_ < _loc11_)
         {
            _loc3_ = _loc8_["infoFd_" + _loc6_];
            _loc3_._width = 289;
            _loc3_._y = _loc9_;
            _loc3_._height = _loc3_.textHeight + 5;
            _loc9_ = _loc3_._y + _loc3_._height + 15;
            _loc7_ = _loc7_ + _loc3_.textHeight + 5 + 10;
            _loc6_ = _loc6_ + 1;
         }
         this._infoScroll.__set__pageSize(_loc7_ + 20);
         this._infoScroll._visible = true;
      }
      var _loc17_ = flash.display.BitmapData.loadBitmap(skillImg);
      lib.display.DrawBitmapData.draw(this._skillInfoMc.skillIcon,_loc17_,0,0,0,0,53,53,0.82);
      lib.display.DrawBitmapData.draw(this._pathSkillMc.skillIcon,_loc17_,0,0,0,0,37,37,0.57);
      this._pathSkillMc._visible = bPath;
      if(bBtn)
      {
         this._skillInfoMc.btn._visible = true;
         this._popUpFocus = skillId;
      }
   }
   function setViewMode(curViewMode)
   {
      this._skillListContainer._visible = !curViewMode;
      this._skillListScroll._visible = !curViewMode;
      this._titleFd_0._visible = !curViewMode;
      this._titleFd_1._visible = !curViewMode;
      this._titleFd_2._visible = !curViewMode;
      this._defaultFd._visible = false;
      this._pathSkillMc._visible = false;
      this._skillInfoMc._visible = false;
   }
   function setTitleText(title_0, title_1, title_2)
   {
      this._titleFd_0.text = title_0;
      this._titleFd_1.text = title_1;
      this._titleFd_2.text = title_2;
   }
   function setDefaultText(defaultText)
   {
      this._defaultFd._visible = true;
      this._defaultFd.htmlText = defaultText;
      this._skillInfoMc._visible = false;
      this._pathSkillMc._visible = false;
   }
   function setPathSkill(pathSkillId, pathSkillName, pathSkillImg, pathSkillCheck, pathSkillTime)
   {
      pathSkillCheck = Number(pathSkillCheck);
      this._pathSkillMc.guideFd._visible = false;
      this._pathSkillMc.timeMc._visible = true;
      g4.manager.TooltipManager.getInstance().removeTooltip(this._pathSkillMc.pathSlot.slotHit);
      g4.manager.TooltipManager.getInstance().addUiTooltip(g4.view.ViewID.SKILL_WINDOW,this._pathSkillMc.pathSlot.slotHit,pathSkillId,0);
      this._pathSkillMc.nameFd.htmlText = pathSkillName;
      this._pathSkillMc.checkBox.checked = pathSkillCheck;
      this._pathSkillMc.checkBox._visible = true;
      var _loc3_ = flash.display.BitmapData.loadBitmap(pathSkillImg);
      lib.display.DrawBitmapData.draw(this._pathSkillMc.pathSlot.img,_loc3_,0,0,0,0,37,37,0.57);
      this._pathSkillMc.pathSlot.TEX = pathSkillImg;
      this._pathSkillMc.timeMc.textFd.text = pathSkillTime + lib.util.UIString.getUIString("$101068");
      this._pathSkillMc.timeMc.textFd.type = "input";
      this._pathSkillMc.timeMc.textFd.selectable = true;
      this._pathSkillMc.timeMc.timeText = pathSkillTime;
   }
   function clearPathSkill(bDeleteSkillIcon)
   {
      if(bDeleteSkillIcon)
      {
         delete this._pathSkillMc.skillIcon.TEX;
         this._pathSkillMc.skillIcon.clear();
      }
      this._pathSkillMc.pathSlot.img.clear();
      delete this._pathSkillMc.pathSlot.TEX;
      this._pathSkillMc.nameFd.htmlText = "";
      this._pathSkillMc.checkBox._visible = false;
      this._pathSkillMc.checkBox.checked = false;
      this._pathSkillMc.timeMc._visible = false;
      this._pathSkillMc.timeMc.textFd.text = "";
      this._pathSkillMc.guideFd._visible = true;
   }
}
