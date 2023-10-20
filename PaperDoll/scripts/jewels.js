// myListener.OnGameEventUpdatePaperDollSlotList
/*

*/ 

function getIcon(input)
{
   if(input.indexOf("89807") != -1)
   {
      return "img://__Icon_Items.BlueCustomize16A_Tex";
   }
   if(input.indexOf("88426") != -1 || input.indexOf("88624") != -1 || input.indexOf("88804") != -1)
   {
      return "img://__Icon_Items.BlueCustomize16B_Tex";
   }
   if(input.indexOf("88429") != -1 || input.indexOf("88627") != -1 || input.indexOf("88807") != -1)
   {
      return "img://__Icon_Items.BlueCustomize16C_Tex";
   }
   if(input.indexOf("88769") != -1 || input.indexOf("88778") != -1 || input.indexOf("88815") != -1 || input.indexOf("88823") != -1)
   {
      return "img://__Icon_Items.BlueCustomize16D_Tex";
   }
   if(input.indexOf("88862") != -1 || input.indexOf("88865") != -1)
   {
      return "img://__Icon_Items.BlueCustomize16E_Tex";
   }
   if(input.indexOf("89805") != -1)
   {
      return "img://__Icon_Items.BlueCustomize17A_Tex";
   }
   if(input.indexOf("88427") != -1 || input.indexOf("88625") != -1 || input.indexOf("88805") != -1)
   {
      return "img://__Icon_Items.BlueCustomize17B_Tex";
   }
   if(input.indexOf("88430") != -1 || input.indexOf("88628") != -1 || input.indexOf("88808") != -1)
   {
      return "img://__Icon_Items.BlueCustomize17C_Tex";
   }
   if(input.indexOf("88770") != -1 || input.indexOf("88779") != -1 || input.indexOf("88816") != -1 || input.indexOf("88824") != -1)
   {
      return "img://__Icon_Items.BlueCustomize17D_Tex";
   }
   if(input.indexOf("88855") != -1 || input.indexOf("88859") != -1)
   {
      return "img://__Icon_Items.BlueCustomize17E_Tex";
   }
//    if(input.indexOf("88421") != -1 || input.indexOf("88619") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize18A_Tex";
//    }
   if(input.indexOf("88428") != -1 || input.indexOf("88626") != -1 || input.indexOf("88806") != -1)
   {
      return "img://__Icon_Items.BlueCustomize18B_Tex";
   }
   if(input.indexOf("88431") != -1 || input.indexOf("88629") != -1 || input.indexOf("88809") != -1)
   {
      return "img://__Icon_Items.BlueCustomize18C_Tex";
   }
   if(input.indexOf("88771") != -1 || input.indexOf("88780") != -1 || input.indexOf("88817") != -1 || input.indexOf("88825") != -1)
   {
      return "img://__Icon_Items.BlueCustomize18D_Tex";
   }
   if(input.indexOf("88856") != -1 || input.indexOf("88860") != -1)
   {
      return "img://__Icon_Items.BlueCustomize18E_Tex";
   }
//    if(input.indexOf("89110") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize19A_Tex";
//    }
//    if(input.indexOf("89111") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize19B_Tex";
//    }
//    if(input.indexOf("89112") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize19C_Tex";
//    }
//    if(input.indexOf("89113") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize19D_Tex";
//    }
//    if(input.indexOf("89114") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize19E_Tex";
//    }
   if(input.indexOf("89130") != -1)
   {
      return "img://__Icon_Items.BlueCustomize19F_Tex";
   }
   if(input.indexOf("89131") != -1)
   {
      return "img://__Icon_Items.BlueCustomize19G_Tex";
   }
   if(input.indexOf("89132") != -1)
   {
      return "img://__Icon_Items.BlueCustomize20A_Tex";
   }
   if(input.indexOf("89133") != -1)
   {
      return "img://__Icon_Items.BlueCustomize20B_Tex";
   }
   if(input.indexOf("89134") != -1)
   {
      return "img://__Icon_Items.BlueCustomize20C_Tex";
   }
//    if(input.indexOf("89010") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize20D_Tex";
//    }
//    if(input.indexOf("89011") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize20E_Tex";
//    }
//    if(input.indexOf("89012") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize20F_Tex";
//    }
//    if(input.indexOf("89013") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize20G_Tex";
//    }
//    if(input.indexOf("89014") != -1)
//    {
//       return "img://__Icon_Items.BlueCustomize21A_Tex";
//    }
   if(input.indexOf("89030") != -1)
   {
      return "img://__Icon_Items.BlueCustomize21B_Tex";
   }
   if(input.indexOf("89031") != -1)
   {
      return "img://__Icon_Items.BlueCustomize21C_Tex";
   }
   if(input.indexOf("89032") != -1)
   {
      return "img://__Icon_Items.BlueCustomize21D_Tex";
   }
   if(input.indexOf("89033") != -1)
   {
      return "img://__Icon_Items.BlueCustomize21E_Tex";
   }
   if(input.indexOf("89034") != -1)
   {
      return "img://__Icon_Items.BlueCustomize21F_Tex";
   }
   return input;
}


// deprecated

// daylight neck crit
if (input.indexOf("88419") != -1  || input.indexOf("88617") != -1)
{
    return"img://__Icon_Items.BlueCustomize16A_Tex";
}
// entropy neck crit
if (input.indexOf( "88426" ) != -1|| input.indexOf("88624") != -1 || input.indexOf("88804") != -1 )
{
    return"img://__Icon_Items.BlueCustomize16B_Tex";
}
// entropy neck power
if (input.indexOf("88429") != -1  || input.indexOf("88627") != -1  || input.indexOf("88807") != -1 )
{
    return"img://__Icon_Items.BlueCustomize16C_Tex";
}
// ethereal neck power
if (input.indexOf("88769") != -1  || input.indexOf("88778") != -1  || input.indexOf("88815") != -1 || input.indexOf("88823") != -1 )
{
    return"img://__Icon_Items.BlueCustomize16D_Tex";
}
// radiant neck power
if (input.indexOf("88862") != -1  || input.indexOf("88865") != -1 )
{
    return"img://__Icon_Items.BlueCustomize16E_Tex";
}
// EARRINGS
// daylight earring crit
if (input.indexOf("88420") != -1  || input.indexOf("88618") != -1 )
{
    return"img://__Icon_Items.BlueCustomize17A_Tex";
}
// entropy earring crit
if (input.indexOf("88427") != -1  || input.indexOf("88625") != -1 || input.indexOf("88805") != -1 )
{
    return"img://__Icon_Items.BlueCustomize17B_Tex";
}
// entropy earring power
if (input.indexOf("88430") != -1  || input.indexOf("88628") != -1  || input.indexOf("88808") != -1 )
{
    return"img://__Icon_Items.BlueCustomize17C_Tex";
}
// ethereal earring power
if (input.indexOf("88770") != -1  || input.indexOf("88779") != -1  || input.indexOf("88816") != -1 || input.indexOf("88824") != -1 )
{
    return"img://__Icon_Items.BlueCustomize17D_Tex";
}
// radiant earring power
if (input.indexOf("88855") != -1  || input.indexOf("88859") != -1 )
{
    return"img://__Icon_Items.BlueCustomize17E_Tex";
}
// RINGS
// daylight ring crit
if (input.indexOf("88421") != -1  || input.indexOf("88619") != -1 )
{
    return"img://__Icon_Items.BlueCustomize18A_Tex";
}
// entropy ring crit
if (input.indexOf("88428") != -1  || input.indexOf("88626") != -1 || input.indexOf("88806") != -1 )
{
    return"img://__Icon_Items.BlueCustomize18B_Tex";
}
// entropy ring power
if (input.indexOf("88431") != -1  || input.indexOf("88629") != -1  || input.indexOf("88809") != -1 )
{
    return"img://__Icon_Items.BlueCustomize18C_Tex";
}
// ethereal ring power
if (input.indexOf("88771") != -1  || input.indexOf("88780") != -1  || input.indexOf("88817") != -1 || input.indexOf("88825") != -1 )
{
    return"img://__Icon_Items.BlueCustomize18D_Tex";
}
// radiant ring power
if (input.indexOf("88856") != -1  || input.indexOf("88860") != -1 )
{
    return"img://__Icon_Items.BlueCustomize18E_Tex";
}

// HALIDOMS
// gidd (crit, common)
if (input.indexOf("89110") != -1)
{
    return"img://__Icon_Items.BlueCustomize19A_Tex";
}
if (input.indexOf("89111") != -1)
{
    return"img://__Icon_Items.BlueCustomize19B_Tex";
}
if (input.indexOf("89112") != -1)
{
    return"img://__Icon_Items.BlueCustomize19C_Tex";
}
if (input.indexOf("89113") != -1)
{
    return"img://__Icon_Items.BlueCustomize19D_Tex";
}
if (input.indexOf("89114") != -1)
{
    return"img://__Icon_Items.BlueCustomize19E_Tex";
}
// dagon (crit,)
if (input.indexOf("89130") != -1)
{
    return"img://__Icon_Items.BlueCustomize19F_Tex";
}
if (input.indexOf("89131") != -1)
{
    return"img://__Icon_Items.BlueCustomize19G_Tex";
}
if (input.indexOf("89132") != -1)
{
    return"img://__Icon_Items.BlueCustomize20A_Tex";
}
if (input.indexOf("89133") != -1)
{
    return"img://__Icon_Items.BlueCustomize20B_Tex";
}
if (input.indexOf("89134") != -1)
{
    return"img://__Icon_Items.BlueCustomize20C_Tex";
}
// RELICS
// isren (crit)
if (input.indexOf("89010") != -1)
{
    return"img://__Icon_Items.BlueCustomize20D_Tex";
}
if (input.indexOf("89011") != -1)
{
    return"img://__Icon_Items.BlueCustomize20E_Tex";
}
if (input.indexOf("89012") != -1)
{
    return"img://__Icon_Items.BlueCustomize20F_Tex";
}
if (input.indexOf("89013") != -1)
{
    return"img://__Icon_Items.BlueCustomize20G_Tex";
}
if (input.indexOf("89014") != -1)
{
    return"img://__Icon_Items.BlueCustomize21A_Tex";
}
// tithus (crit)
if (input.indexOf("89030") != -1)
{
    return"img://__Icon_Items.BlueCustomize21B_Tex";
}
if (input.indexOf("89031") != -1)
{
    return"img://__Icon_Items.BlueCustomize21C_Tex";
}
if (input.indexOf("89032") != -1)
{
    return"img://__Icon_Items.BlueCustomize21D_Tex";
}
if (input.indexOf("89033") != -1)
{
    return"img://__Icon_Items.BlueCustomize21E_Tex";
}
if (input.indexOf("89034") != -1)
{
    return"img://__Icon_Items.BlueCustomize21F_Tex";
}

return input;

//-------------------------------------------------------------
// daylight neck crit
if (_loc8_.indexOf("88419") != -1  || _loc8_.indexOf("88617") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize16A_Tex";
}
// entropy neck crit
else if (_loc8_.indexOf( "88426" ) != -1|| _loc8_.indexOf("88624") != -1 || _loc8_.indexOf("88804") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize16B_Tex";
}
// entropy neck power
else if (_loc8_.indexOf("88429") != -1  || _loc8_.indexOf("88627") != -1  || _loc8_.indexOf("88807") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize16C_Tex";
}
// ethereal neck power
else if (_loc8_.indexOf("88769") != -1  || _loc8_.indexOf("88778") != -1  || _loc8_.indexOf("88815") != -1 || _loc8_.indexOf("88823") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize16D_Tex";
}
// radiant neck power
else if (_loc8_.indexOf("88862") != -1  || _loc8_.indexOf("88865") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize16E_Tex";
}
// EARRINGS
// daylight earring crit
else if (_loc8_.indexOf("88420") != -1  || _loc8_.indexOf("88618") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize17A_Tex";
}
// entropy earring crit
else if (_loc8_.indexOf("88427") != -1  || _loc8_.indexOf("88625") != -1 || _loc8_.indexOf("88805") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize17B_Tex";
}
// entropy earring power
else if (_loc8_.indexOf("88430") != -1  || _loc8_.indexOf("88628") != -1  || _loc8_.indexOf("88808") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize17C_Tex";
}
// ethereal earring power
else if (_loc8_.indexOf("88770") != -1  || _loc8_.indexOf("88779") != -1  || _loc8_.indexOf("88816") != -1 || _loc8_.indexOf("88824") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize17D_Tex";
}
// radiant earring power
else if (_loc8_.indexOf("88855") != -1  || _loc8_.indexOf("88859") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize17E_Tex";
}
// RINGS
// daylight ring crit
else if (_loc8_.indexOf("88421") != -1  || _loc8_.indexOf("88619") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize18A_Tex";
}
// entropy ring crit
else if (_loc8_.indexOf("88428") != -1  || _loc8_.indexOf("88626") != -1 || _loc8_.indexOf("88806") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize18B_Tex";
}
// entropy ring power
else if (_loc8_.indexOf("88431") != -1  || _loc8_.indexOf("88629") != -1  || _loc8_.indexOf("88809") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize18C_Tex";
}
// ethereal ring power
else if (_loc8_.indexOf("88771") != -1  || _loc8_.indexOf("88780") != -1  || _loc8_.indexOf("88817") != -1 || _loc8_.indexOf("88825") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize18D_Tex";
}
// radiant ring power
else if (_loc8_.indexOf("88856") != -1  || _loc8_.indexOf("88860") != -1 )
{
    _loc8_ = "img://__Icon_Items.BlueCustomize18E_Tex";
}

// HALIDOMS
// gidd (crit)
else if (_loc8_.indexOf("89110") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize19A_Tex";
}
else if (_loc8_.indexOf("89111") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize19B_Tex";
}
else if (_loc8_.indexOf("89112") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize19C_Tex";
}
else if (_loc8_.indexOf("89113") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize19D_Tex";
}
else if (_loc8_.indexOf("89114") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize19E_Tex";
}
// dagon (crit)
else if (_loc8_.indexOf("89130") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize19F_Tex";
}
else if (_loc8_.indexOf("89131") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize19G_Tex";
}
else if (_loc8_.indexOf("89132") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize20A_Tex";
}
else if (_loc8_.indexOf("89133") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize20B_Tex";
}
else if (_loc8_.indexOf("89134") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize20C_Tex";
}
// RELICS
// isren (crit)
else if (_loc8_.indexOf("89010") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize20D_Tex";
}
else if (_loc8_.indexOf("89011") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize20E_Tex";
}
else if (_loc8_.indexOf("89012") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize20F_Tex";
}
else if (_loc8_.indexOf("89013") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize20G_Tex";
}
else if (_loc8_.indexOf("89014") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize21A_Tex";
}
// tithus (crit)
else if (_loc8_.indexOf("89030") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize21B_Tex";
}
else if (_loc8_.indexOf("89031") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize21C_Tex";
}
else if (_loc8_.indexOf("89032") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize21D_Tex";
}
else if (_loc8_.indexOf("89033") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize21E_Tex";
}
else if (_loc8_.indexOf("89034") != -1)
{
    _loc8_ = "img://__Icon_Items.BlueCustomize21F_Tex";
}
