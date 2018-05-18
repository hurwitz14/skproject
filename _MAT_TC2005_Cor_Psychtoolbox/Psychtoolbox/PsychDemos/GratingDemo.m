function GratingDemo% GratingDemo shows how to use WhiteIndex, BlackIndex, and 'PutImage' to% display a grating of known contrast at any orientation and pixelSize.%% See also DriftDemo, EpsDemo.% 07/01/99  dgp Arbitrary orientation% 12/10/01  awi added font conditional% 02/21/02  dgp Mention DriftDemo.% 04/03/02  awi Merged Mac and Windows versions, which had fallen out of sync. % 4/13/02   dgp Use Arial, eliminating need for conditional     % windowwhichScreen=0;window=Screen(whichScreen,'OpenWindow');white=WhiteIndex(window);black=BlackIndex(window);gray=(white+black)/2;if round(gray)==white	gray=black;endinc=white-gray;Screen(window,'FillRect',gray);% grating[x,y]=meshgrid(-100:100,-100:100);angle=17*pi/180; % 17 deg orientation; change it to whatever you want.f=0.03*2*pi;a=cos(angle)*f;b=sin(angle)*f;m=exp(-((x/50).^2)-((y/50).^2)).*sin(a*x+b*y);Screen(window,'PutImage',gray+inc*m);% pauseScreen(window,'TextFont','Arial');Screen(window,'TextSize',18);Ask(window,'Done. Hit return to quit.',black,gray,'GetString');Screen(window,'Close');