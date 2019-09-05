class g4.component.G4ComboBox extends g4.core.G4UIComponent
{
   var isInteraction = true;
   function G4ComboBox()
   {
      super();
   }
   function __get__targetWidth()
   {
      return this._targetWidth;
   }
   function __get__originWidth()
   {
      return this._originWidth;
   }
   function __get__scrollBar()
   {
      return this._scrollBar;
   }
   function __get__selectedIndex()
   {
      return this._scrollingList.__get__selectedIndex();
   }
   function __set__selectedIndex(value)
   {
      this._scrollingList.__set__selectedIndex(value);
      if(this._tf_selectLabel.html == true)
      {
         this._tf_selectLabel.htmlText = this._scrollingList.__get__dataProvider()[value].label;
      }
      else
      {
         this._tf_selectLabel.text = this._scrollingList.__get__dataProvider()[value].label;
      }
      return this.__get__selectedIndex();
   }
   function __set__selectLabel(str)
   {
      if(this._tf_selectLabel.html == true)
      {
         this._tf_selectLabel.htmlText = str;
      }
      else
      {
         this._tf_selectLabel.text = str;
      }
      return this.__get__selectLabel();
   }
   function configUI()
   {
      this._tf_selectLabel = this.tf_selectLabel;
      this._openBtn = this.openBtn;
      this._listBg = this.listBg;
      this._backBg = this.backBg;
      this._scrollBar = this.scrollBar;
      this._scrollingList = this.scrollingList;
      this._scrollingList.__set__rowHeight(this._rowHeight);
      this._scrollingList.__set__rowCount(this._rowCount);
      this._scrollingList.__set__scrollBar(this._scrollBar);
      this._scrollingList.__set__itemRenderer(this._itemRenderer);
      this._scrollingList.addEventListener(gfx.events.EventTypes.CHANGE,this,"onScrollingListChange");
      this._scrollingList.addEventListener(gfx.events.EventTypes.ITEM_CLICK,this,"onScrollingListItemClick");
      this._openBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onOpenBtnClick);
      this._mouseListener = {};
      this._mouseListener.onMouseDown = g4.util.Delegate.create(this,this.onEventMouseDown);
      this.hideList();
      this.setResize();
      this._listBgHeight = this._listBg._height;
      this._openBtn.toggle = true;
   }
   function onEventMouseDown()
   {
      if(!this.hitTest(_root._xmouse,_root._ymouse,true))
      {
         this.hideList();
      }
   }
   function setData(datas)
   {
      this._scrollingList.__set__dataProvider(datas);
      this._scrollingList.invalidate();
      var _loc2_ = Math.min(datas.length,this._rowCount) * this._rowHeight;
      this._listBg._height = this._listBgHeight + _loc2_;
   }
   function getData(index)
   {
      return this._scrollingList.__get__dataProvider()[index];
   }
   function setResize()
   {
      this._targetWidth = this._width;
      this._xscale = 100;
      this._originWidth = this._width;
      var _loc2_ = this._originWidth - this._targetWidth;
      this._tf_selectLabel._width = this._tf_selectLabel._width - _loc2_;
      this._listBg._width = this._listBg._width - _loc2_;
      this._backBg._width = this._backBg._width - _loc2_;
      this._scrollingList._width = _loc2_;
      this._openBtn._x = this._openBtn._x - _loc2_;
      this._scrollBar._x = this._scrollBar._x - _loc2_;
      var _loc3_ = this._rowHeight * this._rowCount;
      this._scrollingList._height = this._scrollingList._height + _loc3_;
      this._scrollingList.invalidate();
      this._scrollBar.setSize(this._scrollBar._width,this._scrollBar._height + _loc3_);
   }
   function onOpenBtnClick()
   {
      if(this._openBtn.__get__selected() == false)
      {
         this.hideList();
      }
      else
      {
         this.showList();
      }
      lib.manager.UISound.play(lib.manager.UISound.FULLDOWNMENU_CLICK);
   }
   function showList()
   {
      if(this._scrollBar.thumb._visible == true)
      {
         this._scrollBar._visible = true;
      }
      this._scrollingList._visible = true;
      this._listBg._visible = true;
      this._openBtn.__set__selected(true);
      Mouse.addListener(this._mouseListener);
   }
   function hideList()
   {
      this._scrollBar._visible = false;
      this._scrollingList._visible = false;
      this._listBg._visible = false;
      this._openBtn.__set__selected(false);
      Mouse.removeListener(this._mouseListener);
   }
   function onScrollingListChange()
   {
      this.dispatchEvent(gfx.events.EventTypes.CHANGE);
   }
   function onScrollingListItemClick(event)
   {
      if(this.isInteraction == true)
      {
         var _loc2_ = event.index;
         this.__set__selectedIndex(_loc2_);
      }
      this.hideList();
      this.dispatchEvent(gfx.events.EventTypes.ITEM_CLICK);
   }
   function onUnload()
   {
      Mouse.removeListener(this._mouseListener);
   }
}
