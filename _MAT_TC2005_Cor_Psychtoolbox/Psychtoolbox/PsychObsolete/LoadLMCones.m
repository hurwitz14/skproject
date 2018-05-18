function [T_cones,S_cones] = LoadLMCones(S_use,coneName,lensDensityName,macDensityName,...	lambdaMax,specificDensity,outerSegmentLength)% [T_cones,S_cones] = LoadLMCones(S_use,coneName,lensDensityName,macDensityName,...%		lambdaMax,specificDensity,outerSegmentLength)%% Load L and M cone fundamentals. The fundamentals are% normalized to produce equal quantal sensitivities at% their peaks, but expressed in energy units.%% For standard cone fundamentals (Smith-Pokorny, Stockman et al, etc.),% lambdaMax is used to determine a shift of the spectra.  The nominal% zero point for this use is [561 531] nm, even though these are not% necessarily the actual peaks of the standard functions.  Thus% specifying Smith-Pokorny and [559 531] returns the Smith-Pokorny L% cone sensitivity shifted 2 nm towards the short end of the spectrum.%% Passing a specificDensity of NaN causes the routine to skip the correction% for self-screening; passing lensDensityName and/or macDensityName of 'None'% causes those densities to be zeros.%% Note that routines EnergyToQuanta% and QuantaToEnergy are designed for transforming power,% not sensitivity.  So, for example, to transform sensitivity% from energy to quantal units, we use QuantaToEnergy not% EnergyToQuanta.%% NOTE:  THIS ROUTINE IS STILL UNDER DEVELOPMENT.  USE WITH% CAUTION.%% 6/8/99  dhb  Pulled out into a separate file.% 6/9/99  dhb  Made into a function.%         dhb  Added macular pigment density, args for lens and macular pigment.% 6/10/99 dhb  Shift for standard cone fundamentals, too.% 4/10/01	mpr	 modified the help section to properly reflect order of lambdaMax argument% 7/8/03  dhb  Call functions for lens and macular pigment transmittance.  Didn't test.% Patch up S_use if it is passed as wavelengths.S_use = MakeItS(S_use);% Correction for pre-retinal absorptionlens_transmit = ones(2,1)*HumanLensTransmittance(S_use,lensDensityName);mac_transmit = ones(2,1)*HumanMacularTransmittance(S_use,macDensityName);pre_transmit = lens_transmit .* mac_transmit;switch (coneName)	% For estimates that start out at the cornea, we divide by	% the lens transmittance to get retinal sensitivity, convert	% to quantal units, normalize, and then multiply the	% lens transmisivity back in again.  This makes the normalization	% at the level of the pigments.  We also do a wavelength shift  % relative to [531,561] based on passed lambdaMax vector.	case 'SmithPokorny',		%fprintf('Loading cone fundamentals: %s\n',coneName);		load T_cones_sp;		T_cones = T_cones_sp(1:2,:);		S_cones = S_cones_sp;		T_cones = SplineCmf(S_cones,T_cones,S_use);		S_cones = S_use;		clear T_cones_sp S_cones_sp		LShift = lambdaMax(1)-561;		MShift = lambdaMax(2)-531;		T_cones(1,:) = ShiftSpectra(T_cones(1,:),S_cones,LShift);		T_cones(2,:) = ShiftSpectra(T_cones(2,:),S_cones,MShift);		T_quantal = QuantaToEnergy(SToWls(S_cones),T_cones'./pre_transmit')';		T_quantal = T_quantal ./ (max(T_quantal,[],2)*ones(1,size(T_quantal,2)));		T_cones = EnergyToQuanta(SToWls(S_cones),T_quantal')'.*pre_transmit;	case 'StockmanMacleod',		%fprintf('Loading cone fundamentals: %s\n',coneName);		load T_cones_smj		T_cones = T_cones_smj(1:2,:);		S_cones = S_cones_smj;		T_cones = SplineCmf(S_cones,T_cones,S_use);		S_cones = S_use;		LShift = lambdaMax(1)-561;		MShift = lambdaMax(2)-531;		T_cones(1,:) = ShiftSpectra(T_cones(1,:),S_cones,LShift);		T_cones(2,:) = ShiftSpectra(T_cones(2,:),S_cones,MShift);		clear T_cones_smj S_cones_smj		T_quantal = QuantaToEnergy(SToWls(S_cones),T_cones'./pre_transmit')';		T_quantal = T_quantal ./ (max(T_quantal,[],2)*ones(1,size(T_quantal,2)));		T_cones = EnergyToQuanta(SToWls(S_cones),T_quantal')'.*pre_transmit;			% For estimates that start out as nomograms, we adjust for self-screening  % and normalize in the original quantal units, convert to energy spectra,  % and then multiply by the pre-retinal transmitance.	case 'Dawis',		%fprintf('Generating cone fundamentals: %s\n',coneName);		S_cones = S_use;		T_quantal = DawisNomogram(SToWls(S_cones),lambdaMax);		T_quantal = AdjustForSelfScreening(T_quantal,specificDensity,outerSegmentLength);		T_quantal = T_quantal ./ (max(T_quantal,[],2)*ones(1,size(T_quantal,2)));		T_cones = EnergyToQuanta(SToWls(S_cones),T_quantal')'.*pre_transmit;	case 'Baylor',		%fprintf('Generating cone fundamentals: %s\n',coneName);		S_cones = S_use;		T_quantal = BaylorNomogram(SToWls(S_cones),lambdaMax);		T_quantal = AdjustForSelfScreening(T_quantal,specificDensity,outerSegmentLength);		T_quantal = T_quantal ./ (max(T_quantal,[],2)*ones(1,size(T_quantal,2)));		T_cones = EnergyToQuanta(SToWls(S_cones),T_quantal')'.*pre_transmit;	otherwise,		error('Unsupported cone type requested');endT_cones = T_cones/max(max(T_cones));