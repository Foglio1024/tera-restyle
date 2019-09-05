class g4.component.G4ScrollingList extends gfx.controls.ScrollingList
{
   function G4ScrollingList()
   {
      super();
   }
   function __set__margin(value)
   {
      super.margin = value;
      return this.__get__margin();
   }
   function __get__margin()
   {
      return super.margin;
   }
   function getRendererAt(index)
   {
      return super.getRendererAt(index);
   }
}
