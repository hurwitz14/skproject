for n=1:length(contra_data)
    contra_data(n).ds1.filename = [contra_data(n).id ' ' contra_data(n).side];
    contra_data(n).ds1.icell = n;%[contra_data(n).id ' ' contra_data(n).side];
end;


contra8902122_cf1498Hz=contra_data(1:6);
contra8703910_cf1345Hz=contra_data(7:82);
contra871027_cf2397Hz=contra_data(83:110);
contra8900739_cf2470Hz=contra_data(111:116);
contra870399_cf7184Hz=contra_data(117:140);
contra8914127_cf2018Hz=contra_data(141:161);
contra8810715_cf1345Hz=contra_data(162:175);
contra8709127_cf10508Hz=contra_data(176:184);
contra8915116_cf840Hz=contra_data(185:279);

[Info, Slope] = structplotdata(contra8902122_cf1498Hz,'ctsum','al_from_ml','fit','linear','xlim',[0 0.5],'ylim',[0 8000]);
[mostrostralz,mostrostrali]=min(structfield(contra_data(1:6),'z'));
[mostcaudalz,mostcaudali]=max(structfield(contra_data(1:6),'z'));
ri=mostrostrali;
ci=mostcaudali;
for n=1:6
    contra_data(n).slopempers=Slope*10^(-3);contra_data(n).pCorr=Info.pCorr;
    contra_data(n).inneRClength=((contra_data(ri).x-contra_data(ci).x)^2+(contra_data(ri).y-contra_data(ci).y)^2+(contra_data(ri).z-contra_data(ci).z)^2)^0.5;
    contra_data(n).inneRCwidth=abs(mostrostralz-mostcaudalz);
end;

[Info, Slope] = structplotdata(contra8703910_cf1345Hz,'ctsum','al_from_ml','fit','linear','xlim',[0 0.5],'ylim',[0 8000]);
[mostrostralz,mostrostrali]=min(structfield(contra_data(7:82),'z'));
[mostcaudalz,mostcaudali]=max(structfield(contra_data(7:82),'z'));
ri=mostrostrali+6;
ci=mostcaudali+6;
for n=7:82
    contra_data(n).slopempers=Slope*10^(-3);contra_data(n).pCorr=Info.pCorr;
    contra_data(n).inneRClength=((contra_data(ri).x-contra_data(ci).x)^2+(contra_data(ri).y-contra_data(ci).y)^2+(contra_data(ri).z-contra_data(ci).z)^2)^0.5;
    contra_data(n).inneRCwidth=abs(mostrostralz-mostcaudalz);   
end;

[Info, Slope] = structplotdata(contra871027_cf2397Hz,'ctsum','al_from_ml','fit','linear','xlim',[0 0.5],'ylim',[0 8000]);
[mostrostralz,mostrostrali]=min(structfield(contra_data(83:110),'z'));
[mostcaudalz,mostcaudali]=max(structfield(contra_data(83:110),'z'));
ri=mostrostrali+82;
ci=mostcaudali+82;
for n=83:110
    contra_data(n).slopempers=Slope*10^(-3);contra_data(n).pCorr=Info.pCorr;
    contra_data(n).inneRClength=((contra_data(ri).x-contra_data(ci).x)^2+(contra_data(ri).y-contra_data(ci).y)^2+(contra_data(ri).z-contra_data(ci).z)^2)^0.5;
    contra_data(n).inneRCwidth=abs(mostrostralz-mostcaudalz);
end;

[Info, Slope] = structplotdata(contra8900739_cf2470Hz,'ctsum','al_from_ml','fit','linear','xlim',[0 0.5],'ylim',[0 8000]);
[mostrostralz,mostrostrali]=min(structfield(contra_data(111:116),'z'));
[mostcaudalz,mostcaudali]=max(structfield(contra_data(111:116),'z'));
ri=mostrostrali+110;
ci=mostcaudali+110;
for n=111:116
    contra_data(n).slopempers=Slope*10^(-3);contra_data(n).pCorr=Info.pCorr;
    contra_data(n).inneRClength=((contra_data(ri).x-contra_data(ci).x)^2+(contra_data(ri).y-contra_data(ci).y)^2+(contra_data(ri).z-contra_data(ci).z)^2)^0.5;
    contra_data(n).inneRCwidth=abs(mostrostralz-mostcaudalz);
end;

[Info, Slope] = structplotdata(contra870399_cf7184Hz,'ctsum','al_from_ml','fit','linear','xlim',[0 0.5],'ylim',[0 8000]);
[mostrostralz,mostrostrali]=min(structfield(contra_data(117:140),'z'));
[mostcaudalz,mostcaudali]=max(structfield(contra_data(117:140),'z'));
ri=mostrostrali+116;
ci=mostcaudali+116;
for n=117:140
    contra_data(n).slopempers=Slope*10^(-3);contra_data(n).pCorr=Info.pCorr;
    contra_data(n).inneRClength=((contra_data(ri).x-contra_data(ci).x)^2+(contra_data(ri).y-contra_data(ci).y)^2+(contra_data(ri).z-contra_data(ci).z)^2)^0.5;
    contra_data(n).inneRCwidth=abs(mostrostralz-mostcaudalz);
end;

[Info, Slope] = structplotdata(contra8914127_cf2018Hz,'ctsum','al_from_ml','fit','linear','xlim',[0 0.5],'ylim',[0 8000]);
[mostrostralz,mostrostrali]=min(structfield(contra_data(141:161),'z'));
[mostcaudalz,mostcaudali]=max(structfield(contra_data(141:161),'z'));
ri=mostrostrali+140;
ci=mostcaudali+140;
for n=141:161
    contra_data(n).slopempers=Slope*10^(-3);contra_data(n).pCorr=Info.pCorr;
    contra_data(n).inneRClength=((contra_data(ri).x-contra_data(ci).x)^2+(contra_data(ri).y-contra_data(ci).y)^2+(contra_data(ri).z-contra_data(ci).z)^2)^0.5;
    contra_data(n).inneRCwidth=abs(mostrostralz-mostcaudalz);
end;

[Info, Slope] = structplotdata(contra8810715_cf1345Hz,'ctsum','al_from_ml','fit','linear','xlim',[0 0.5],'ylim',[0 8000]);
[mostrostralz,mostrostrali]=min(structfield(contra_data(162:175),'z'));
[mostcaudalz,mostcaudali]=max(structfield(contra_data(162:175),'z'));
ri=mostrostrali+161;
ci=mostcaudali+161;
for n=162:175
    contra_data(n).slopempers=Slope*10^(-3);contra_data(n).pCorr=Info.pCorr;
    contra_data(n).inneRClength=((contra_data(ri).x-contra_data(ci).x)^2+(contra_data(ri).y-contra_data(ci).y)^2+(contra_data(ri).z-contra_data(ci).z)^2)^0.5;
    contra_data(n).inneRCwidth=abs(mostrostralz-mostcaudalz);
end;

[Info, Slope] = structplotdata(contra8709127_cf10508Hz,'ctsum','al_from_ml','fit','linear','xlim',[0 0.5],'ylim',[0 8000]);
[mostrostralz,mostrostrali]=min(structfield(contra_data(176:184),'z'));
[mostcaudalz,mostcaudali]=max(structfield(contra_data(176:184),'z'));
ri=mostrostrali+175;
ci=mostcaudali+175;
for n=176:184
    contra_data(n).slopempers=Slope*10^(-3);contra_data(n).pCorr=Info.pCorr;
    contra_data(n).inneRClength=((contra_data(ri).x-contra_data(ci).x)^2+(contra_data(ri).y-contra_data(ci).y)^2+(contra_data(ri).z-contra_data(ci).z)^2)^0.5;
    contra_data(n).inneRCwidth=abs(mostrostralz-mostcaudalz);
end;

[Info, Slope] = structplotdata(contra8915116_cf840Hz,'ctsum','al_from_ml','fit','linear','xlim',[0 0.5],'ylim',[0 8000]);
[mostrostralz,mostrostrali]=min(structfield(contra_data(185:279),'z'));
[mostcaudalz,mostcaudali]=max(structfield(contra_data(185:279),'z'));
ri=mostrostrali+184;
ci=mostcaudali+184;
for n=185:279
    contra_data(n).slopempers=Slope*10^(-3);contra_data(n).pCorr=Info.pCorr;
    contra_data(n).inneRClength=((contra_data(ri).x-contra_data(ci).x)^2+(contra_data(ri).y-contra_data(ci).y)^2+(contra_data(ri).z-contra_data(ci).z)^2)^0.5;
    contra_data(n).inneRCwidth=abs(mostrostralz-mostcaudalz);
end;

% Create template
scrsz = get(0,'ScreenSize')
FigHdl = figure('Units','centimeters','Position',[0 0 17.6 22]);


structplot(contra8915116_cf840Hz,'ctsum','al_from_ml',...
    contra8703910_cf1345Hz,'ctsum','al_from_ml',...
    contra8810715_cf1345Hz,'ctsum','al_from_ml',...
    contra8902122_cf1498Hz,'ctsum','al_from_ml',...
    contra8914127_cf2018Hz,'ctsum','al_from_ml',...
    contra871027_cf2397Hz,'ctsum','al_from_ml',...
    contra8900739_cf2470Hz,'ctsum','al_from_ml',...
    contra870399_cf7184Hz,'ctsum','al_from_ml',...
    contra8709127_cf10508Hz,'ctsum','al_from_ml',...
    'info','no','fit','linear','xlim',[0 0.45],'ylim',[0 8000],...
    'markers',{'^f','vw'},...
    'colors',{'k','b', 'b', 'c', 'c', 'g', 'g', 'r','r'});hold on;
hold off;

set(gcf,'Units','centimeters','Position',[0 0 17.6 22]);%,'PaperType', 'A4', 'PaperOrientation','Portrait');%,'PaperUnits','Normalized','PaperPosition', [0.081 0.1296 0.8381 0.7407]);


CurFig=gcf;
HdlA=getplot(CurFig,2);HdlB=getplot(CurFig,1);
HdlA=copyobj(HdlA,FigHdl);HdlB=copyobj(HdlB,FigHdl);
set(HdlA,'units','centimeters','position',[2 15 6 6],'xtick',[0:0.2:1],'fontsize',8);
axes(HdlA);
xlabel('Conduction time from ML (ms)','fontsize',8);
ylabel('Axonal length from ML (\mum)','fontsize',8);
set(findobj(gca,'Type','line'),'markersize',5);
%Hdls=get(HdlA,'children')
box off;
set(HdlB,'units','centimeters','position',[2 11 6 3]);
axes(HdlB);
set(findobj(gca,'Type','line'),'markersize',5,'linestyle','none');
box off;
%Hdls=get(HdlA,'children')
close(CurFig);












