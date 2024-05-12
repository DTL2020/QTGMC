LoadPlugin("mostdiffval.dll")
LoadPlugin("mvtools2.dll")

LoadPlugin("masktools2.dll")
LoadPlugin("plugins_JPSDR.dll")
LoadPlugin("RgTools.dll")
LoadPlugin("TDeint.dll")

Import("Zs_RF_Shared.avsi")
Import("QTGMC2.avsi")


Function GetSharpest2(clip c1, clip c2)
{
  avg=GaussResize(Layer(c1, c2, "fast"), c1.width, c1.height, src_left=0.001, src_top=0.001, p=2)

  return MostDiffVal(avg, c1, c2)
}

Function M_QTGMC_high(clip input, int "TR2", int "ThSAD2")
{
 
 TR2=Default(TR2, 6)
 ThSAD2=Default(ThSAD2, 150)

 c_bs8=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)
 c_bs8_notm=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=false, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_notmnopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=false, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)


 c_bs16=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMstep=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMstep=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)
 c_bs16_notm=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=false, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMstep=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_notmnopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=false, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMstep=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1,SrchClipPP=0)

 mdv8_1=GetSharpest2(c_bs8, c_bs8_nopp)
 mdv8_2=GetSharpest2(c_bs8_notmnopp, c_bs8_notm)
 mdv8=GetSharpest2(mdv8_1, mdv8_2)

 mdv16_1=GetSharpest2(c_bs16, c_bs16_nopp)
 mdv16_2=GetSharpest2(c_bs16_notmnopp, c_bs16_notm)
 mdv16=GetSharpest2(mdv16_1, mdv16_2)

 return GetSharpest2(mdv8, mdv16)
}

Function M_QTGMC_medhigh(clip input, int "TR2", int "ThSAD2")
{
 
 TR2=Default(TR2, 3)
 ThSAD2=Default(ThSAD2, 150)

 c_bs8=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 c_bs16=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 mdv=GetSharpest2(c_bs8, c_bs8_nopp)
 mdv2=GetSharpest2(c_bs16, c_bs16_nopp)

 return GetSharpest2(mdv, mdv2)
}


Function M_QTGMC(clip input, int "TR2", int "ThSAD2")
{
 
 TR2=Default(TR2, 2)
 ThSAD2=Default(ThSAD2, 150)

 c_bs8=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 c_bs16=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 mdv=GetSharpest2(c_bs8, c_bs8_nopp)
 mdv2=GetSharpest2(c_bs16, c_bs16_nopp)

 return GetSharpest2(mdv, mdv2)
}

Function M_QTGMC_medlow(clip input, int "TR2", int "ThSAD2")
{
 
 TR2=Default(TR2, 1)
 ThSAD2=Default(ThSAD2, 150)

 c_bs8=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=2, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=2, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 c_bs16=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 mdv=GetSharpest2(c_bs8, c_bs8_nopp)
 mdv2=GetSharpest2(c_bs16, c_bs16_nopp)

 return GetSharpest2(mdv, mdv2)
}

Function M_QTGMC_low(clip input, int "TR2", int "ThSAD2")
{
 
 TR2=Default(TR2, 0)
 ThSAD2=Default(ThSAD2, 150)

 c_bs8=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=1, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=0, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=8, SubPel=1, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=0, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 c_bs16=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=0, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=0, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 mdv=GetSharpest2(c_bs8, c_bs8_nopp)
 mdv2=GetSharpest2(c_bs16, c_bs16_nopp)

 return GetSharpest2(mdv, mdv2)
}

