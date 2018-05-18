function dacBits = ScreenDacBits(w)% dacBits = ScreenDacBits(windowPtrOrScreenNumber)%% What is the precision of the DACs on this graphics card?% % At present you need to know the bit depth of your graphics board's DAC% to determine how to write its CLUT, i.e. Screen 'SetClut' or 'Gamma'.% Use this routine and ScreenUsesHighGammaBits, instead of the the brand-% and platform-specific IsRadiusThunder10 and IsATIRadeon10, to keep your% program as general as possible, not tied to particular hardware or% platform.% % The value is set in PrepareScreen.m.% % See also LoadClut, ScreenPixelSize, ScreenUsesHighGammaBits, ScreenClutSize.% 2/27/02  dhb,ly  Wrote it.% 3/20/02  dgp		 Cosmetic.% 3/26/02  dhb     Gen2 Radeon card check.% 6/6/02   dgp     Renamed DriverDacBits. When we don't know dacBits, ask the driver.% 6/7/02   dgp     Cache the answer.% 6/8/02   dgp     Renamed ScreenDacBits. % 6/20/02  dgp     Moved all code to PrepareScreen.m.dacBits=Screen(w,'Preference','DacBits');