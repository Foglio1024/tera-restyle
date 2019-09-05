class g4.simplePopup.SimplePopupType extends g4.model.Enum
{
   static var SEVANT_STORAGE_RESULT_SIMPLE_POPUP = new g4.simplePopup.SimplePopupType("SEVANT_STORAGE_RESULT_SIMPLE_POPUP","ServantStorageResultSimplePopup.swf");
   static var MATERIAL_ITEM_SLOT_LIST_SIMPLE_POPUP = new g4.simplePopup.SimplePopupType("MATERIAL_ITEM_SLOT_LIST_SIMPLE_POPUP","MaterialItemSlotListSimplePopup.swf");
   static var CONFIRM_SIMPLE_POPUP = new g4.simplePopup.SimplePopupType("CONFIRM_SIMPLE_POPUP","ConfirmSimplePopup.swf");
   static var ITEM_AMOUNT_INPUT_SIMPLE_POPUP = new g4.simplePopup.SimplePopupType("ITEM_AMOUNT_INPUT_SIMPLE_POPUP","ItemAmountInputSimplePopup.swf");
   static var MATERIAL_SELECT_SIMPLE_POPUP = new g4.simplePopup.SimplePopupType("MATERIAL_SELECT_SIMPLE_POPUP","MaterialSelectSimplePopup.swf");
   static var SORT_SETTRING_SIMPLE_POPUP = new g4.simplePopup.SimplePopupType("SORT_SETTRING_SIMPLE_POPUP","SortSettingSimplePopup.swf");
   function SimplePopupType(id, fileName)
   {
      super(id);
      this.fileName = fileName;
   }
   static function parse(name)
   {
      return (g4.simplePopup.SimplePopupType)g4.model.Enum.parse(name,g4.simplePopup.SimplePopupType);
   }
}
