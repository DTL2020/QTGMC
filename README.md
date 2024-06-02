# QTGMC
Supplement of QTGMC script for using of new features of mvtools2 versions post 2.7.45 (hardware acceleration via DX12, interpolated overlap and may be more).

Known issues with mvtools 2.7.46_a.xx and 2.8.0-a.00 - too slow start time of script in comparison with pinterf build 2.7.45.

# M_QTGMC
Wrapper around several QTGMC calls with different set of params (mostly different motion estimation params giving different results at different areas of a frame) and selection best areas to output using different statistical algorithms.

Currently avaialble preset-functions of M_QTGMC:

M_QTGMC_high() - highest preset. Uses 3 different modes of 2 ways in each for MAnalyse (blocksize 8x8 and 16x16, pre-processing on and off, truemotion on and off). Also uses higher AreaMode and ME params. Subsample precision of 1/4 (QPEL).
M_QTGMC_medhigh() - medium high preset. Uses 2 different modes of 2 ways in each for MAnalyse (blocksize 8x8 and 16x16, pre-processing on and off). Also uses medium high AreaMode params. Subsample precision of 1/4 (QPEL).
M_QTGMC() - average quality and performance preset. 
M_QTGMC_medlow() - medium low preset. Subsample precision of 1/2 (HPEL).
M_QTGMC_low() - low preset. Subsample precision of 1 (FPEL). No AreaMode.

Available params:
1. smode (integer) - sample selection mode. 0 - most different value (from low-pass filtered average). Make more sharpness but less 'linear' look. 1 - median. Make softer look but more 'linear'.

Other params:  TR2, ThSAD2, ThSCD1, SourceMatch, Lossless, Sharpness, MatchPreset, MatchPreset2 - see QTGMC documentation at http://avisynth.nl/index.php/QTGMC . MatchPreset and MatchPreset2 internally default to UltraFast and not follow preset 'slow' as in QTGMC. So it is required to manually set MatchPreset and MatchPreset2 to required value if default UltraFast is not enough.


Known issues with mvtools 2.7.46_a.xx and 2.8.0-a.00 - too slow start time of script in comparison with pinterf build 2.7.45.
