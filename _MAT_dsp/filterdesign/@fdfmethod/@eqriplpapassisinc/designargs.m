function args = designargs(this, hspecs)
%DESIGNARGS Return the arguments for the design method.

%   Copyright 2005-2011 The MathWorks, Inc.

A = [convertmagunits(hspecs.Apass, 'db', 'linear', 'pass') ...
    convertmagunits(hspecs.Astop, 'db', 'linear', 'stop')];

[freqFactor power] = getisincparams(this,hspecs);

if freqFactor > 1/hspecs.Fstop
  warning(message('dsp:fdfmethod:eqriplpapassisinc:designargs:InvalidFreqFactor'));
end

switch this.StopbandShape,
    case 'flat',
        if this.StopbandDecay~=0,
            warning(message('dsp:fdfmethod:eqriplpapassisinc:designargs:InvalidSpecifications'));
        end
        decay = 0;
    case 'linear',
        decay = this.StopbandDecay;
end

invsincArgs = [freqFactor power];
if hspecs.CICRateChangeFactor == 1
  invSincType = 'invsinc';
else  
  invSincType = 'invdiric';
  % Need to multiply freqFactor times 2 to obtain the differential delay
  % since this is what firceqrip uses in its calculations.
  invsincArgs = [invsincArgs(1)*2 invsincArgs(2) hspecs.CICRateChangeFactor];  
end

args = {hspecs.FilterOrder, ...
    hspecs.Fstop, ...
    A, ...
    'slope', decay, ...
    invSincType, invsincArgs, ...
    'stopedge'};

% [EOF]