LoadPlugin("mostdiffval.dll")
LoadPlugin("mvtools2.dll")

LoadPlugin("masktools2.dll")
LoadPlugin("plugins_JPSDR.dll")
LoadPlugin("RgTools.dll")
LoadPlugin("Average.dll")

Import("Zs_RF_Shared.avsi")
Import("QTGMC2.avsi")

Function GetSharpest(clip c1, clip c2)
{
  avg=Average(c1.GaussResize(c1.width, c1.height, src_left=0.001, src_top=0.001, p=2), 0.5, c2.GaussResize(c2.width, c2.height, src_left=0.001, src_top=0.001, p=2), 0.5)

  return MostDiffVal(avg, c1, c2)
}


Function M_QTGMC(clip input)
{

 c_bs8=QTGMC2(input, preset="slow", thSAD2=150, BlockSize=8, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=1, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", thSAD2=150, BlockSize=8, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=1, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 c_bs16=QTGMC2(input, preset="slow", thSAD2=150, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=1, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", thSAD2=150, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=1, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 mdv=GetSharpest(c_bs8, c_bs8_nopp)
 mdv2=GetSharpest(c_bs16, c_bs16_nopp)

 return GetSharpest(mdv, mdv2)
}
