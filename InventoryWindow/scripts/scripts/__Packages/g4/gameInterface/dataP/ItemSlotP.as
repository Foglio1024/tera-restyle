class g4.gameInterface.dataP.ItemSlotP extends g4.gameInterface.dataP.BasicDataP
{
   var Index = -1;
   var Id = "";
   var IconPath = "";
   var Name = "";
   var Amount = -1;
   var Grade = -1;
   var SealType = -1;
   var Master = -1;
   var Enchant = -1;
   var Durability = -1;
   var Impossible = false;
   var Disabled = false;
   var PeriodInfo = "";
   function ItemSlotP(data)
   {
      super(data);
   }
}
