class g4.gameInterface.dataP.skillWindow.GrowSkillDetailMaterialP extends g4.gameInterface.dataP.BasicDataP
{
   var NeedCount = -1;
   var HasCount = -1;
   function GrowSkillDetailMaterialP(data)
   {
      super(data);
      this.itemSlotP = new g4.gameInterface.dataP.ItemSlotP(this.ItemSlotP);
   }
}
