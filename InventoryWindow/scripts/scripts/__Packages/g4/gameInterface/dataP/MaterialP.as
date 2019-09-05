class g4.gameInterface.dataP.MaterialP extends g4.gameInterface.dataP.BasicDataP
{
   var ItemSlotP = null;
   var NeedCount = -1;
   var HasCount = -1;
   var NeedGold = -1;
   var HasGold = -1;
   var itemSlotP = null;
   function MaterialP(data)
   {
      super(data);
      this.itemSlotP = new g4.gameInterface.dataP.ItemSlotP(this.ItemSlotP);
   }
}
