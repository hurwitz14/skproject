function RestoreScreen(screenNumber,screenInfo)% RestoreScreen([windowPtrOrScreenNumber])% If present, this function is called by Screen when the last on-screen% window is closed (among all screens). This includes the special cases of% when an error is caught and reported by Screen.mex, and when Screen.mex% is flushed, e.g. by "clear mex" or "clear screen". In order to be sure% of finishing the closing sequence, when Screen calls this file it% "traps" errors, i.e. reports any error as a warning, and proceeds. Bear% in mind that anytime Screen hits an error it must run this file before% it can report the error, so don't put anything here that might compound% the error. % % See also PrepareScreen.% 4/21/02 dgp Wrote it.% 6/15/02 dgp Made args optional.% 6/23/02 dgp Cleaned up.% 6/27/02 dgp Don't assume "res" field is present. Thanks to Chris Chase for%             reporting the bug.if ~strcmp(computer,'MAC2')	returnendif nargin==0	for s=Screen('Screens');		RestoreScreen(s);	end	returnendglobal screenGlobalscreenNumber=Screen(screenNumber,'WindowScreenNumber');screenGlobal(screenNumber+1).open=0;if isfield(screenGlobal,'res') & ~isempty(screenGlobal(screenNumber+1).res)% 	res=Screen(screenNumber,'ResolutionQuickly');% 	if res.mode ~= screenGlobal(screenNumber+1).res.mode% 		% Also restores screen gamma and clut to normal. But it's slow.% 		Screen(screenNumber,'Resolution',screenGlobal(screenNumber+1).res);% 	end	res=screenGlobal(screenNumber+1).res;else	res=Screen(screenNumber,'Resolution');endScreen(screenNumber,'Resolution',res); % Slow, but always restores everything.% We're done, so go back to 8-bit gamma table for maximum compatibility.% Screen(screenNumber,'Gamma',[0:255]',8); % Screen(screenNumber,'SetClut',ClutDefault(screenNumber,8),0,8);