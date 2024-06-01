LoadPlugin("mostdiffval.dll")
LoadPlugin("mvtools2.dll")
LoadPlugin("Average.dll")
LoadPlugin("masktools2.dll")
LoadPlugin("plugins_JPSDR.dll")
LoadPlugin("RgTools.dll")
LoadPlugin("TDeint.dll")
LoadPlugin("vsTTempSmooth.dll")

Import("Zs_RF_Shared.avsi")
Import("QTGMC2.avsi")


Function GetSharpest2(clip c1, clip c2)
{
  avg=GaussResize(Layer(c1, c2, "fast"), c1.width, c1.height, src_left=0.001, src_top=0.001, p=2)

  return MostDiffVal(avg, c1, c2)
}

Function GetSharpest2_4(clip c1, clip c2, clip c3, clip c4)
{
 mdv=GetSharpest2(c1, c2)
 mdv2=GetSharpest2(c3, c4)

 return GetSharpest2(mdv, mdv2)

}

Function GetMedian4(clip c1, clip c2, clip c3, clip c4)
{
 avg=Average(c1, 0.25, c2, 0.25, c3, 0.25, c4, 0.25)
 int=Interleave(c1, c2, avg, c3, c4)
 med=vsTTempsmooth(int, pmode=1, maxr=2, ythresh=256, uthresh=256, vthresh=256)
 return SelectEvery(med, 5, 2)
}

Function M_QTGMC_high(clip input, int "TR2", int "ThSAD2", int "ThSCD1", int "SourceMatch", int "Lossless", float "Sharpness", string "MatchPreset", string "MatchPreset2")
{
 
 TR2=Default(TR2, 4)
 ThSAD2=Default(ThSAD2, 150)
 ThSCD1=Default(ThSCD1, 180)
 SourceMatch=Default(SourceMatch, 0)
 Lossless=Default(Lossless, 0)
 Sharpness=Default(Sharpness, 1.0)
 MatchPreset=Default(MatchPreset, "Ultra Fast")
 MatchPreset2=Default(MatchPreset2, "Ultra Fast")

 c_bs8=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMpel=0, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMpel=0, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)
 c_bs8_notm=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=false, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMpel=0, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_notmnopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=false, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMpel=0, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)


 c_bs16=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMstep=2, mvt_AMflags=1, mvt_AMpel=0, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMstep=2, mvt_AMflags=1, mvt_AMpel=0, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)
 c_bs16_notm=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=false, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMstep=2, mvt_AMflags=1, mvt_AMpel=0, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_notmnopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=false, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMstep=2, mvt_AMflags=1, mvt_AMpel=0, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1,SrchClipPP=0)

 mdv8_1=GetSharpest2(c_bs8, c_bs8_nopp)
 mdv8_2=GetSharpest2(c_bs8_notmnopp, c_bs8_notm)
 mdv8=GetSharpest2(mdv8_1, mdv8_2)

 mdv16_1=GetSharpest2(c_bs16, c_bs16_nopp)
 mdv16_2=GetSharpest2(c_bs16_notmnopp, c_bs16_notm)
 mdv16=GetSharpest2(mdv16_1, mdv16_2)

 return GetSharpest2(mdv8, mdv16)
}

Function M_QTGMC_medhigh(clip input, int "TR2", int "ThSAD2", int "ThSCD1", int "SourceMatch", int "Lossless", float "Sharpness", string "MatchPreset", string "MatchPreset2")
{
 
 TR2=Default(TR2, 3)
 ThSAD2=Default(ThSAD2, 150)
 ThSCD1=Default(ThSCD1, 180)
 SourceMatch=Default(SourceMatch, 0)
 Lossless=Default(Lossless, 0)
 Sharpness=Default(Sharpness, 1.0)
 MatchPreset=Default(MatchPreset, "Ultra Fast")
 MatchPreset2=Default(MatchPreset2, "Ultra Fast")

 c_bs8=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=0, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 c_bs16=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=4, Search=3, SearchParam=4, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=2, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 mdv=GetSharpest2(c_bs8, c_bs8_nopp)
 mdv2=GetSharpest2(c_bs16, c_bs16_nopp)

 return GetSharpest2(mdv, mdv2)
}


Function M_QTGMC(clip input, int "TR2", int "ThSAD2", int "ThSCD1", int "SourceMatch", int "Lossless", float "Sharpness", string "MatchPreset", string "MatchPreset2", int "smode")
{
 
 TR2=Default(TR2, 2)
 ThSAD2=Default(ThSAD2, 150)
 ThSCD1=Default(ThSCD1, 180)
 SourceMatch=Default(SourceMatch, 0)
 Lossless=Default(Lossless, 0)
 Sharpness=Default(Sharpness, 1.0)
 MatchPreset=Default(MatchPreset, "Ultra Fast")
 MatchPreset2=Default(MatchPreset2, "Ultra Fast")
 SMode =Default(smode, 0) # output selection mode: 0 - mostdiffval, 1 - median

 c_bs8=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 c_bs16=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=4, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=4, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=4, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)
 
 return (Smode == 0) ? GetSharpest2_4(c_bs8, c_bs8_nopp, c_bs16, c_bs16_nopp) : \
 GetMedian4(c_bs8, c_bs8_nopp, c_bs16, c_bs16_nopp)  

}

Function M_QTGMC_medlow(clip input, int "TR2", int "ThSAD2", int "ThSCD1", int "SourceMatch", int "Lossless", float "Sharpness", string "MatchPreset", string "MatchPreset2")
{
 
 TR2=Default(TR2, 1)
 ThSAD2=Default(ThSAD2, 150)
 ThSCD1=Default(ThSCD1, 180)
 SourceMatch=Default(SourceMatch, 0)
 Lossless=Default(Lossless, 0)
 Sharpness=Default(Sharpness, 1.0)
 MatchPreset=Default(MatchPreset, "Ultra Fast")
 MatchPreset2=Default(MatchPreset2, "Ultra Fast")

 c_bs8=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=2, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", thSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=2, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=2, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 c_bs16=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=2, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=4, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=2, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=1, mvt_AMoffset=4, mvt_AMflags=1, mvt_AMavg=6, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 mdv=GetSharpest2(c_bs8, c_bs8_nopp)
 mdv2=GetSharpest2(c_bs16, c_bs16_nopp)

 return GetSharpest2(mdv, mdv2)
}

Function M_QTGMC_low(clip input, int "TR2", int "ThSAD2", int "ThSCD1", int "SourceMatch", int "Lossless", float "Sharpness", string "MatchPreset", string "MatchPreset2")
{
 
 TR2=Default(TR2, 0)
 ThSAD2=Default(ThSAD2, 150)
 ThSCD1=Default(ThSCD1, 180)
 SourceMatch=Default(SourceMatch, 0)
 Lossless=Default(Lossless, 0)
 Sharpness=Default(Sharpness, 1.0)
 MatchPreset=Default(MatchPreset, "Ultra Fast")
 MatchPreset2=Default(MatchPreset2, "Ultra Fast")

 c_bs8=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=1, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=0, mvt_mdp=6, mvt_mpm=1)
 c_bs8_nopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=8, SubPel=1, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=0, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 c_bs16=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=1, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=0, mvt_mdp=6, mvt_mpm=1)
 c_bs16_nopp=QTGMC2(input, preset="slow", ThSAD2=ThSAD2, ThSCD1=ThSCD1, SourceMatch=SourceMatch, MatchPreset=MatchPreset, MatchPreset2=MatchPreset2, Lossless=Lossless, Sharpness=Sharpness, BlockSize=16, SubPel=1, Search=3, SearchParam=2, Overlap=4, ChromaMotion=true, GlobalMotion=true, TrueMotion=true, TR2=TR2, mvt_SearchOption=1, mvt_AreaMode=0, mvt_mdp=6, mvt_mpm=1, SrchClipPP=0)

 mdv=GetSharpest2(c_bs8, c_bs8_nopp)
 mdv2=GetSharpest2(c_bs16, c_bs16_nopp)

 return GetSharpest2(mdv, mdv2)
}

