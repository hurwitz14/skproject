function PR650close% PR650close%% Close serial port used to talk to colorimeter.  Reset% serial global.%% 4/4/00  dhb, jdt  Added protection against multiple closes.% 21502   dhb       Change name.global infoCif (~isempty(infoC))   PsychSerial('Close',infoC);   infoC = [];end