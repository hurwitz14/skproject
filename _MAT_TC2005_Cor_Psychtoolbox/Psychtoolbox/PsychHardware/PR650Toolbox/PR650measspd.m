function [spd,qual] = PR650measspd(S)% [spd,qual] = PR650measspd(S)%% Make a measurement of the spectrum.%% 4/4/00  dhb, jdt  Add comments, clean.% 4/14/00 dhb       "quality"->"qual" so value is returned.% 8/29/00 dhb       Modified to handle quality codes as with Mac version.% 1/10/02 dhb				Handle reading of returns more generally.  Some Mac%										drivers seem to only read to EOL.% 2/15/02 dhb       Change name.% 3/10/02 dhb       Pull out string parsing into separate routine.% Global storageglobal infoC% Check for initializationif (isempty(infoC))   error('Meter has not been initialized.');end% Set wavelength sampling if passed.if (nargin < 1 | isempty(S))   S = [380 5 81];end% Initializetimeout = 30;% See if we can sync to the source% and set sync mode appropriately.syncFreq = PR650getsyncfreq;if (~isempty(syncFreq))	PR650setsyncfreq(1);else	PR650setsyncfreq(0);end% Do raw readreadStr = PR650rawspd(timeout);% fprintf('Got data\n');qual = sscanf(readStr,'%f',1);	 % Check for sync mode error condition.  If get one,% turn off sync and try again.if (qual == 7 | qual == 8)	PR650setsyncfreq(0);	readStr = PR650rawspd(timeout);	qual = sscanf(readStr,'%f',1);end	% Check for other error conditionsif (qual == -1 | qual == 10)  %disp('Low light level during measurement');  %disp('Setting returned value to zero');  spd = zeros(S(3),1);elseif (qual == 18 | qual == 0)	spd = PR650parsespdstr(readStr,S);	elseif (qual ~= 0)  error(sprintf('Bad return code %g from meter',qual));end	