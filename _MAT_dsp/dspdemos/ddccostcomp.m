function str = ddccostcomp(Fs_cddc,c_cddc,Fs_addc,c_addc)
%DDCCOSTCOMP Utility to display the implementation cost of DDCs
% "IF Subsampling with Complex Multirate Filters"

%   Copyright 2010 The MathWorks, Inc.

NBTMult = 1;          % Cost for baseband translation
cMultPerMicroSec = (NBTMult*Fs_cddc+c_cddc.MultPerInputSample*Fs_cddc)/1e6;
cAddPerMicroSec  = c_cddc.AddPerInputSample*Fs_cddc/1e6;

NHMult = 1;           % Cost of Heterodyne
aMultPerMicroSec = (NHMult*40e3+c_addc.MultPerInputSample*Fs_addc)/1e6;
aAddPerMicroSec  = c_addc.AddPerInputSample*Fs_addc/1e6;

str = sprintf('%s\n%s\n%s%d%s%d\n%s%d%s%d\n%s%d%s%d\n%s%g%s%g\n%s%g%s%g', ...
    'Total Cost                      : Conventional DDC | IF subsampling', ...
    '-------------------------------------------------------------------', ...
    'Number of Multipliers           :               ',NBTMult+c_cddc.NMult,...
    ' |             ',NHMult+c_addc.NMult, ...
    'Number of Adders                :               ',c_cddc.Nadd,...
    ' |             ',c_addc.Nadd, ...
    'Number of States                :               ',c_cddc.Nstates,...
    ' |             ',c_addc.Nstates, ...
    'Multiplications per microsecond :             ',cMultPerMicroSec,...
    ' |            ',aMultPerMicroSec, ...
    'Additions per microsecond       :             ',cAddPerMicroSec,...
    ' |            ',aAddPerMicroSec);

% [EOF]