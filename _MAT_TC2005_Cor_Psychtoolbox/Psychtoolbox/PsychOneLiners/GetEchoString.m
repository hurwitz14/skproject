function string = GetEchoString(window,msg,x,y,textColor,bgColor)% string = GetEchoString(window,msg,x,y,textColor,bgColor)% % Get a string typed at the keyboard. Entry is terminated by% <return> or <enter>.%% Typed characters are displayed in the window. The delete% character is handled correctly. Useful for i/o in a Screen window.%% See also: GetNumber, GetString, GetEchoNumber%% 2/4/97  dhb  Wrote GetEchoNumber.% 2/5/97  dhb  Accept <enter> as well as <cr>.%         dhb  Allow string return as well.% 3/3/97  dhb  Updated for new DrawText.  % 3/15/97 dgp  Created GetEchoString based on dhb's GetEchoNumber.% 3/20/97 dhb  Fixed bug in erase code, it wasn't updated for new%              initialization.% 3/31/97 dhb  More fixes for same bug.% 2/28/98 dgp  Use GetChar instead of obsolete GetKey. Use SWITCH and LENGTH.% 3/27/98 dhb  Put an abs around char in switch.% Write the message and a spaceScreen(window,'DrawText',[msg '  '],x,y,textColor);% Determine position for first characteroffset = Screen(window,'TextWidth',[msg '  ']);string='';while 1	% Loop until <return> or <enter>	char= GetChar;	switch(abs(char))		case {13,3},	% <return> or <enter>			break;		case 8,			% <delete>			if length(string)>0				deletedChar = string(length(string));				string=string(1:length(string)-1);				offset = offset - Screen(window,'TextWidth',deletedChar);   				%fprintf('Deleting %s at %g\n',deletedChar,offset);				Screen(window,'DrawText',deletedChar,x+offset,y,bgColor);   			end		otherwise,			string=[string char];			%fprintf('Drawing %s at %g\n',char,offset);			Screen(window,'DrawText',char,x+offset,y,textColor);			offset = offset + Screen(window,'TextWidth',char);			%fprintf('New offset is %g\n',offset);	endend% Erase the messageScreen(window,'DrawText',[msg '  ' string],x,y,bgColor);