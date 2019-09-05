class g4.gameInterface.dataP.inventoryWindow.InventoryItemSlotP extends g4.gameInterface.dataP.BasicDataP
{
   var IsNew = false;
   var IsFilter = false;
   var IsSearchResult = false;
   function InventoryItemSlotP(data)
   {
      super(data);
   }
   static function teraParse(data)
   {
      var _loc1_ = new g4.gameInterface.dataP.inventoryWindow.InventoryItemSlotP();
      _loc1_.IsNew = Boolean(data[0] == "1");
      _loc1_.IsFilter = Boolean(data[1] == "1");
      _loc1_.IsSearchResult = Boolean(data[2] == "1");
      _loc1_.itemSlotP = new g4.gameInterface.dataP.ItemSlotP();
      _loc1_.itemSlotP.Index = Number(data[3]);
      _loc1_.itemSlotP.Id = String(data[4]);
      _loc1_.itemSlotP.IconPath = String(data[5]);
      _loc1_.itemSlotP.Name = String(data[6]);
      _loc1_.itemSlotP.Amount = Number(data[7]);
      _loc1_.itemSlotP.Grade = Number(data[8]);
      _loc1_.itemSlotP.SealType = Number(data[9]);
      _loc1_.itemSlotP.Master = Number(data[10]);
      _loc1_.itemSlotP.Enchant = Number(data[11]);
      _loc1_.itemSlotP.Durability = Number(data[12]);
      _loc1_.itemSlotP.Impossible = Boolean(data[13] == "1");
      _loc1_.itemSlotP.Disabled = Boolean(data[14] == "1");
      _loc1_.itemSlotP.PeriodInfo = String(data[15]);
      return _loc1_;
   }
}
