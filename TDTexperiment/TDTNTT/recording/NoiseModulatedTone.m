%MakeNoiseModulatedTone


DataRoot='C:\Data\StimData\NoiseModulatedTone_10sec';

Precision='int16';
Fs=48828.125;
NChan=2;
Dur=10;
MaxFm=500;
nRep=10;

%Carrier frequencies
FcRange=[100 20000];
FcList=2.^(log2(FcRange(1)):1/6:log2(FcRange(2)));
%FcList=2.^(log2(FcRange(1)):1/6:log2(FcRange(2)));
nFc=length(FcList);

%Compute gerbil's ERB
dCB=0.37;
a=2.2/11.1;
A=398;
EarQ=1/(dCB*a*log(10));
minBW=dCB*a*log(10)*A;
order=1;
ERBList = ((FcList/EarQ).^order + minBW^order).^(1/order);

%
Count=0;
h=waitbar(0,'Please wait');
for iFc=1:nFc
    Fc=FcList(iFc);
    ERB=ERBList(iFc);
    Fm=min([ERB/2 MaxFm]);
    ResampleFactor=ceil(Fs/Fm);
    for iRep=1:nRep
        
        FileRoot=sprintf('NoiseModSin_F%d_MaxModF%d_#%d',round(Fc),round(Fm),iRep);
        
        Count=Count+1;
        waitbar(Count/(nFc*nRep),h,FileRoot);
        
        %Generate signal
        Fs_mod=Fs/ResampleFactor;
        modulator=randn(1,length(0:1/Fs_mod:Dur));
        modulator=resample(modulator,ResampleFactor,1);
        modulator=modulator*0.2+1;
        NPts=length(modulator);
        signal=modulator.*sin(2*pi*Fc*((1:NPts)/Fs));
        signal=signal/max(abs(signal))*10;
        level=20*log10(sqrt(mean(signal.*signal)));
        signal=Cos2RampMs(signal,5,Fs);
        
        %Scale the signal
        switch lower(Precision)
            case 'int16'
                signal=signal/10*(2^15);
            case 'int32'
                signal=signal/10*(2^32);
        end
        
        %Save the signal
        WavFName=fullfile(DataRoot,[FileRoot,'.wav']);
        fid=fopen(WavFName,'wb');
        cnt=fwrite(fid,[signal(:)'; signal(:)'],Precision);
        if cnt~=NPts*2
            error('Unmatched number of data points when saving');
        end
        fclose(fid);   
        
        %save the info file
        InfFName=fullfile(DataRoot,[FileRoot,'.inf']);
        fid=fopen(InfFName,'wt');
        fprintf(fid,'WavFName=''%s'';\n',WavFName); %
        fprintf(fid,'Date=''%d/%d/%d %d:%d:%d'';\n',fix(clock)); %
        fprintf(fid,'Precision=''%s'';\n',Precision); %
        fprintf(fid,'Fs=%f;\n',Fs); %
        fprintf(fid,'NPts=%d;\n',NPts); %
        fprintf(fid,'NChan=%d;\n',NChan); %
        fprintf(fid,'MinLevel=[%f %f];\n',level,level); %
        fprintf(fid,'MedLevel=[%f %f];\n',level,level); %
        fprintf(fid,'MaxLevel=[%f %f];\n',level,level); %
        fprintf(fid,'Duration=%f;\n',Dur); %
        fprintf(fid,'CarrierFreq=%d;\n',Fc); %
        fprintf(fid,'MaxModFreq=%d;\n',Fm); %
        fclose(fid);
    end
end
close(h);