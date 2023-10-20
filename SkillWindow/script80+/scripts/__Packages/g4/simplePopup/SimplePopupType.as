class g4.simplePopup.SimplePopupType extends g4.model.Enum
{
   static var CONFIRM_SIMPLE_POPUP = new g4.simplePopup.SimplePopupType("CONFIRM_SIMPLE_POPUP","ConfirmSimplePopup.swf");
   static var MATERIAL_ITEM_SLOT_LIST_SIMPLE_POPUP = new g4.simplePopup.SimplePopupType("MATERIAL_ITEM_SLOT_LIST_SIMPLE_POPUP","MaterialItemSlotListSimplePopup.swf");
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
