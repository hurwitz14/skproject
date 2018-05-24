%figure1
figure
SIZE=size(BBICselectBB3);
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',10);hold on;
    xlabel([num2str((k-1)*200) '<=DomF<' num2str(k*200)],'FontSize',6,'Units','normalized','Position',[0.5,1]);
    
    for m=1:SIZE(2)
        clear Dif;
        
        clear Diff;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
            if (BBICselectBB3(m).DomF>=(k-1)*200)&(BBICselectBB3(m).DomF<k*200)
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %old requirement for bump
                    %modified to any peak or trough
                    %if BBICselectBB3(m).CD>=0
                        [p,q]=max(abs(bumpM(1,:)));maxbumpidx=bumpM(2,q);
                        %else
                        %[p,q]=min(bumpM(1,:));maxbumpidx=bumpM(2,q);
                        %end;
                    BBICselectBB3(m).bumpfreq1=BBICselectBB3(m).sigpX(maxbumpidx);
                    BBICselectBB3(m).bumphight1=Dif(maxbumpidx);
                    %display([BBICselectBB3(m).CD Dif(maxbumpidx)])
                    
                    plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'k');grid on;hold on;%axis([0 3000 -2 2]);
                    
                    plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                    plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).RateBF,BBICselectWithCF(m).RateBF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'c.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).ThrCF,BBICselectWithCF(m).ThrCF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'r.','MarkerSize',8);
                    plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'b*','MarkerSize',6);hold on
                        
                    
                else
                    plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'k');grid on;hold on;%axis([0 3000 -2 2]);
                    
                    plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                    plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).RateBF,BBICselectWithCF(m).RateBF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'c.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).ThrCF,BBICselectWithCF(m).ThrCF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'r.','MarkerSize',8);
                        
                end;
            end;
    
    end;
    hold off;
    
end;

assignin('base','BBICselectBB3',BBICselectBB3);
clear Dif

%figure2
figure
SIZE=size(BBICselectBB3);
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',10);hold on;
    xlabel([num2str((k-1)*200) '<=DomF<' num2str(k*200)],'FontSize',6,'Units','normalized','Position',[0.5,1]);
    
    for m=1:SIZE(2)
        clear Dif;
        
        clear Diff;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
            if (BBICselectBB3(m).DomF>=(k-1)*200)&(BBICselectBB3(m).DomF<k*200)
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %new requirement for bump
                    if BBICselectBB3(m).CD>=0
                        candi=find(bumpM(1,:)>=0);bumpM2=bumpM(:,candi);
                        [p,q]=max(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    else
                        candi=find(bumpM(1,:)<0);bumpM2=bumpM(:,candi);
                        [p,q]=min(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    end;
                    clear candi;clear bumpM2
                    BBICselectBB3(m).bumpfreq2=BBICselectBB3(m).sigpX(maxbumpidx);
                    
                    BBICselectBB3(m).bumphight1=Dif(maxbumpidx);
                    %display([BBICselectBB3(m).CD Dif(maxbumpidx)])
                    
                    plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'k');grid on;hold on;%axis([0 3000 -2 2]);
                    
                    plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                    plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).RateBF,BBICselectWithCF(m).RateBF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'c.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).ThrCF,BBICselectWithCF(m).ThrCF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'r.','MarkerSize',8);
                    plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'b*','MarkerSize',6);hold on
                        
                    
                else
                    plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'k');grid on;hold on;%axis([0 3000 -2 2]);
                    
                    plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                    plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).RateBF,BBICselectWithCF(m).RateBF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'c.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).ThrCF,BBICselectWithCF(m).ThrCF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'r.','MarkerSize',8);
                        
                end;
            end;
    
    end;
    hold off;
    
end;

assignin('base','BBICselectBB3',BBICselectBB3);
clear Dif

%figure3
figure
SIZE=size(BBICselectBB3);
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',10);hold on;
    xlabel([num2str((k-1)*200) '<=DomF<' num2str(k*200)],'FontSize',6,'Units','normalized','Position',[0.5,1]);
    
    for m=1:SIZE(2)
        clear Dif;
        
        clear Diff;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
            if (BBICselectBB3(m).DomF>=(k-1)*200)&(BBICselectBB3(m).DomF<k*200)
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %old requirement for bump
                    %modified to any peak or trough
                    %if BBICselectBB3(m).CD>=0
                        [p,q]=max(abs(bumpM(1,:)));maxbumpidx=bumpM(2,q);
                        %else
                        %[p,q]=min(bumpM(1,:));maxbumpidx=bumpM(2,q);
                        %end;
                    BBICselectBB3(m).bumpfreq1=BBICselectBB3(m).sigpX(maxbumpidx);
                    BBICselectBB3(m).bumphight1=Dif(maxbumpidx);
                    
                    plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);grid on;hold on;axis([0 3000 -0.2 0.2]);
                    plot(BBICselectBB3(m).sigpX(maxbumpidx),Dif(maxbumpidx),'b*','MarkerSize',6);hold on
                        
                end;
            end;
    
    end;
    hold off;
    
end;

assignin('base','BBICselectBB3',BBICselectBB3);
clear Dif

%figure4
figure
SIZE=size(BBICselectBB3);
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',10);hold on;
    xlabel([num2str((k-1)*200) '<=DomF<' num2str(k*200)],'FontSize',6,'Units','normalized','Position',[0.5,1]);
    
    for m=1:SIZE(2)
        clear Dif;
        
        clear Diff;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
            if (BBICselectBB3(m).DomF>=(k-1)*200)&(BBICselectBB3(m).DomF<k*200)
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %new requirement for bump
                    if BBICselectBB3(m).CD>=0
                        candi=find(bumpM(1,:)>=0);bumpM2=bumpM(:,candi);
                        [p,q]=max(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    else
                        candi=find(bumpM(1,:)<0);bumpM2=bumpM(:,candi);
                        [p,q]=min(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    end;
                    clear candi;clear bumpM2
                    BBICselectBB3(m).bumpfreq2=BBICselectBB3(m).sigpX(maxbumpidx);
                    
                    BBICselectBB3(m).bumphight1=Dif(maxbumpidx);
                    
                    plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);grid on;hold on;axis([0 3000 -0.2 0.2]);
                    plot(BBICselectBB3(m).sigpX(maxbumpidx),Dif(maxbumpidx),'b*','MarkerSize',6);hold on
                        
                end;
            end;
    
    end;
    hold off;
    
end;

assignin('base','BBICselectBB3',BBICselectBB3);
clear Dif

%figure 1
figure
SIZE=size(BBICselectBB3);
%BBICselectBB3_S=BBICselectBB3;
Nn=0;
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',8);hold on;
    N=0;
    for m=1:SIZE(2)
        clear Dif;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
        if BBICselectWithCF(m).ThrCF>0
            
            if (BBICselectBB3(m).ThrCF>=(k-1)*200)&(BBICselectBB3(m).ThrCF<k*200)
                
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %old requirement for bump
                    %modified to any peak or trough
                    %if BBICselectBB3(m).CD>=0
                        [p,q]=max(abs(bumpM(1,:)));maxbumpidx=bumpM(2,q);
                        %else
                        %[p,q]=min(bumpM(1,:));maxbumpidx=bumpM(2,q);
                        %end;
                    BBICselectBB3_S(m).bumpfreq1=BBICselectBB3(m).sigpX(maxbumpidx);    
                        
                    Low=BBICselectBB3(m).DomF*(2^(-1/3));
                    High=BBICselectBB3(m).DomF*(2^(1/3));
                    if Low<=BBICselectBB3(m).sigpX(maxbumpidx)&BBICselectBB3(m).sigpX(maxbumpidx)<=High
                        plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'b');grid on;hold on;%axis([0 3000 -2 2]);
                        plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                        plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                        plot(BBICselectBB3(m).RateBF,BBICselectBB3(m).RateBF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'c.','MarkerSize',8);
                        plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                        
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'m*','MarkerSize',6);hold on
                        
                        N=[N m];
                    end;
                end;
            end;
        end;
    end;
    hold off;
    Nn=[Nn N];display(Nn)
end;
hold off
Number1=length(find(Nn>0));display(Number1)
assignin('base','BBICselectBB3',BBICselectBB3);

%figure 2
figure
SIZE=size(BBICselectBB3);
%BBICselectBB3_S=BBICselectBB3;
Nn=0;
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',8);hold on;
    N=0;
    for m=1:SIZE(2)
        clear Dif;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
        if BBICselectWithCF(m).ThrCF>0
            
            if (BBICselectBB3(m).ThrCF>=(k-1)*200)&(BBICselectBB3(m).ThrCF<k*200)
                %new requirement for bump
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %new requirement for bump
                    if BBICselectBB3(m).CD>=0
                        candi=find(bumpM(1,:)>=0);bumpM2=bumpM(:,candi);
                        [p,q]=max(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    else
                        candi=find(bumpM(1,:)<0);bumpM2=bumpM(:,candi);
                        [p,q]=min(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    end;
                    clear candi;clear bumpM2
                    BBICselectBB3(m).bumpfreq2=BBICselectBB3(m).sigpX(maxbumpidx);    
                        
                    Low=BBICselectBB3(m).DomF*(2^(-1/3));
                    High=BBICselectBB3(m).DomF*(2^(1/3));
                    if Low<=BBICselectBB3(m).sigpX(maxbumpidx)&BBICselectBB3(m).sigpX(maxbumpidx)<=High
                        plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'b');grid on;hold on;%axis([0 3000 -2 2]);
                        plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                        plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                        plot(BBICselectBB3(m).RateBF,BBICselectBB3(m).RateBF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'c.','MarkerSize',8);
                        plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                        
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'m*','MarkerSize',6);hold on
                        
                        N=[N m];
                    end;
                end;
            end;
        end;
    end;
    hold off;
    Nn=[Nn N];display(Nn)
end;
hold off
Number1=length(find(Nn>0));display(Number1)
assignin('base','BBICselectBB3',BBICselectBB3);

%figure3
figure
SIZE=size(BBICselectBB3);
Nn2=0;Nn3=0;
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',8);hold on;
    N2=0;N3=0;
    for m=1:SIZE(2)
        clear Dif;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
        if BBICselectBB3(m).ThrCF>0
            
            if (BBICselectBB3(m).ThrCF>=(k-1)*200)&(BBICselectBB3(m).ThrCF<k*200)
                
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %old requirement for bump
                    %modified to any peak or trough
                    %if BBICselectBB3(m).CD>=0
                        [p,q]=max(abs(bumpM(1,:)));maxbumpidx=bumpM(2,q);
                        %else
                        %[p,q]=min(bumpM(1,:));maxbumpidx=bumpM(2,q);
                        %end;
                    BBICselectBB3(m).bumpfreq1=BBICselectBB3(m).sigpX(maxbumpidx);    
                        
                    Low=BBICselectBB3(m).DomF*(2^(-1/3));
                    High=BBICselectBB3(m).DomF*(2^(1/3));
                    if BBICselectBB3(m).sigpX(maxbumpidx)<Low|High<BBICselectBB3(m).sigpX(maxbumpidx)
                        plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'b');grid on;hold on;%axis([0 3000 -2 2]);
                        plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                        plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                        plot(BBICselectBB3(m).RateBF,BBICselectBB3(m).RateBF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'c.','MarkerSize',8);
                        plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                        
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'b*','MarkerSize',6);hold on
                        
                        N2=[N2 m];
                    end;
                else
                    plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'b');grid on;hold on;%axis([0 3000 -2 2]);
                    plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                    plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                    plot(BBICselectBB3(m).RateBF,BBICselectBB3(m).RateBF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'c.','MarkerSize',8);
                    plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                    N3=[N3 m];    
                end;
                clear maxbumpidx
            end;
        end;
    end;
    hold off;
    Nn2=[Nn2 N2];display(Nn2);Nn3=[Nn3 N3];display(Nn3);
end;
display(Number1);
Number2=length(find(Nn2>0));display(Number2);Number3=length(find(Nn3>0));display(Number3);
assignin('base','BBICselectBB3',BBICselectBB3);

%figure4
figure
SIZE=size(BBICselectBB3);
Nn2=0;Nn3=0;
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',8);hold on;
    N2=0;N3=0;
    for m=1:SIZE(2)
        clear Dif;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
        if BBICselectBB3(m).ThrCF>0
            
            if (BBICselectBB3(m).ThrCF>=(k-1)*200)&(BBICselectBB3(m).ThrCF<k*200)
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %new requirement for bump
                    if BBICselectBB3(m).CD>=0
                        candi=find(bumpM(1,:)>=0);bumpM2=bumpM(:,candi);
                        [p,q]=max(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    else
                        candi=find(bumpM(1,:)<0);bumpM2=bumpM(:,candi);
                        [p,q]=min(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    end;
                    clear candi;clear bumpM2
                    BBICselectBB3(m).bumpfreq2=BBICselectBB3(m).sigpX(maxbumpidx);    
                        
                    Low=BBICselectBB3(m).DomF*(2^(-1/3));
                    High=BBICselectBB3(m).DomF*(2^(1/3));
                    if BBICselectBB3(m).sigpX(maxbumpidx)<Low|High<BBICselectBB3(m).sigpX(maxbumpidx)
                        plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'b');grid on;hold on;%axis([0 3000 -2 2]);
                        plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                        plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                        plot(BBICselectBB3(m).RateBF,BBICselectBB3(m).RateBF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'c.','MarkerSize',8);
                        plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                        
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'b*','MarkerSize',6);hold on
                        
                        N2=[N2 m];
                    end;
                else
                    plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'b');grid on;hold on;%axis([0 3000 -2 2]);
                    plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                    plot(BBICselectBB3(m).DomF,BBICselectBB3(m).DomF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'g.','MarkerSize',8);
                    plot(BBICselectBB3(m).RateBF,BBICselectBB3(m).RateBF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'c.','MarkerSize',8);
                    plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                    N3=[N3 m];    
                end;
                clear maxbumpidx
            end;
        end;
    end;
    hold off;
    Nn2=[Nn2 N2];display(Nn2);Nn3=[Nn3 N3];display(Nn3);
end;
display(Number1);
Number2=length(find(Nn2>0));display(Number2);Number3=length(find(Nn3>0));display(Number3);
assignin('base','BBICselectBB3',BBICselectBB3);

%figure5
figure
SIZE=size(BBICselectBB3);
Nn2=0;Nn3=0;
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',10);hold on;
    xlabel([num2str((k-1)*200) '<=DomF<' num2str(k*200)],'FontSize',6,'Units','normalized','Position',[0.5,1]);
    
    N2=0;N3=0;
    for m=1:SIZE(2)
        clear Dif;
        
        clear Diff;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
        %if BBICselectWithCF(m).ThrCF>0
            if (BBICselectBB3(m).DomF>=(k-1)*200)&(BBICselectBB3(m).DomF<k*200)
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %old requirement for bump
                    %modified to any peak or trough
                    %if BBICselectBB3(m).CD>=0
                        [p,q]=max(abs(bumpM(1,:)));maxbumpidx=bumpM(2,q);
                        %else
                        %[p,q]=min(bumpM(1,:));maxbumpidx=bumpM(2,q);
                        %end;
                    BBICselectBB3(m).bumpfreq1=BBICselectBB3(m).sigpX(maxbumpidx);
                    BBICselectBB3(m).bumphight1=Dif(maxbumpidx);
                    %display([BBICselectBB3(m).CD Dif(maxbumpidx)])
                    
                    Low=BBICselectBB3(m).DomF*(2^(-1/3));
                    High=BBICselectBB3(m).DomF*(2^(1/3));
                    
                    plot(BBICselectBB3(m).sigpX,Dif,'k');grid on;hold on;%axis([0 3000 -2 2]);
                    [closeV closeI]=min(abs(BBICselectBB3(m).DomF*ones(1,length(BBICselectBB3(m).sigpX))-BBICselectBB3(m).sigpX));
                    plot(BBICselectBB3(m).DomF,Dif(closeI),'g.','MarkerSize',8);
                    
                    
                    
                    if BBICselectBB3(m).sigpX(maxbumpidx)<Low|High<BBICselectBB3(m).sigpX(maxbumpidx)
                        
                        %plot(BBICselectWithCF(m).lineX,BBICselectWithCF(m).lineYr,'k--');
                        %plot(BBICselectWithCF(m).DomF,BBICselectWithCF(m).DomF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'g.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).RateBF,BBICselectWithCF(m).RateBF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'c.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).ThrCF,BBICselectWithCF(m).ThrCF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'r.','MarkerSize',8);
                        
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),Dif(maxbumpidx),'b*','MarkerSize',6);hold on
                        
                    elseif Low<=BBICselectBB3(m).sigpX(maxbumpidx)&BBICselectBB3(m).sigpX(maxbumpidx)<=High
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),Dif(maxbumpidx),'m*','MarkerSize',6);hold on
                    else
                        N2=[N2 m];
                    end;
                else
                    plot(BBICselectBB3(m).sigpX,Dif,'r');grid on;hold on;%axis([0 3000 -2 2]);
                    [closeV closeI]=min(abs(BBICselectBB3(m).DomF*ones(1,length(BBICselectBB3(m).sigpX))-BBICselectBB3(m).sigpX));
                    plot(BBICselectBB3(m).DomF,Dif(closeI),'g.','MarkerSize',8);
                    
                    %plot(BBICselectWithCF(m).lineX,BBICselectWithCF(m).lineYr,'k--');
                    %plot(BBICselectWithCF(m).DomF,BBICselectWithCF(m).DomF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'g.','MarkerSize',8);
                    %plot(BBICselectWithCF(m).RateBF,BBICselectWithCF(m).RateBF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'c.','MarkerSize',8);
                    %plot(BBICselectWithCF(m).ThrCF,BBICselectWithCF(m).ThrCF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'r.','MarkerSize',8);
                    N3=[N3 m];    
                end;
            end;
            %end;
    end;
    hold off;
    Nn2=[Nn2 N2];%display(Nn2);
    Nn3=[Nn3 N3];%display(Nn3);
end;

Number2=length(find(Nn2>0));display(Number2);Number3=length(find(Nn3>0));display(Number3);
assignin('base','BBICselectBB3',BBICselectBB3);
clear Dif



%figure6
figure
SIZE=size(BBICselectBB3);
Nn2=0;Nn3=0;
for k=1:18
    NN=ceil(k/6)-1;
    axes('Position',[(k-NN*6-1)*(1/6)+0.02 NN*(1/3)+0.02 1/6-0.02 1/3-0.02],'FontSize',10);hold on;
    xlabel([num2str((k-1)*200) '<=DomF<' num2str(k*200)],'FontSize',6,'Units','normalized','Position',[0.5,1]);
    
    N2=0;N3=0;
    for m=1:SIZE(2)
        clear Dif;
        
        clear Diff;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
        %if BBICselectWithCF(m).ThrCF>0
            if (BBICselectBB3(m).DomF>=(k-1)*200)&(BBICselectBB3(m).DomF<k*200)
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                        
                    end;
                    bumpM(:,1)=[];
                    %new requirement for bump
                    if BBICselectBB3(m).CD>=0
                        candi=find(bumpM(1,:)>=0);bumpM2=bumpM(:,candi);
                        [p,q]=max(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    else
                        candi=find(bumpM(1,:)<0);bumpM2=bumpM(:,candi);
                        [p,q]=min(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    end;
                    clear candi;clear bumpM2
                    
                    BBICselectBB3(m).bumpfreq2=BBICselectBB3(m).sigpX(maxbumpidx);
                    BBICselectBB3(m).bumphight2=Dif(maxbumpidx);
                    %display([BBICselectBB3(m).CD Dif(maxbumpidx)])
                    
                    Low=BBICselectBB3(m).DomF*(2^(-1/3));
                    High=BBICselectBB3(m).DomF*(2^(1/3));
                    
                    plot(BBICselectBB3(m).sigpX,Dif,'k');grid on;hold on;%axis([0 3000 -2 2]);
                    [closeV closeI]=min(abs(BBICselectBB3(m).DomF*ones(1,length(BBICselectBB3(m).sigpX))-BBICselectBB3(m).sigpX));
                    plot(BBICselectBB3(m).DomF,Dif(closeI),'g.','MarkerSize',8);
                    
                    
                    
                    if BBICselectBB3(m).sigpX(maxbumpidx)<Low|High<BBICselectBB3(m).sigpX(maxbumpidx)
                        
                        %plot(BBICselectWithCF(m).lineX,BBICselectWithCF(m).lineYr,'k--');
                        %plot(BBICselectWithCF(m).DomF,BBICselectWithCF(m).DomF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'g.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).RateBF,BBICselectWithCF(m).RateBF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'c.','MarkerSize',8);
                        %plot(BBICselectWithCF(m).ThrCF,BBICselectWithCF(m).ThrCF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'r.','MarkerSize',8);
                        
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),Dif(maxbumpidx),'b*','MarkerSize',6);hold on
                        
                    elseif Low<=BBICselectBB3(m).sigpX(maxbumpidx)&BBICselectBB3(m).sigpX(maxbumpidx)<=High
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),Dif(maxbumpidx),'m*','MarkerSize',6);hold on
                    else
                        N2=[N2 m];
                    end;
                else
                    plot(BBICselectBB3(m).sigpX,Dif,'r');grid on;hold on;%axis([0 3000 -2 2]);
                    [closeV closeI]=min(abs(BBICselectBB3(m).DomF*ones(1,length(BBICselectBB3(m).sigpX))-BBICselectBB3(m).sigpX));
                    plot(BBICselectBB3(m).DomF,Dif(closeI),'g.','MarkerSize',8);
                    
                    %plot(BBICselectWithCF(m).lineX,BBICselectWithCF(m).lineYr,'k--');
                    %plot(BBICselectWithCF(m).DomF,BBICselectWithCF(m).DomF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'g.','MarkerSize',8);
                    %plot(BBICselectWithCF(m).RateBF,BBICselectWithCF(m).RateBF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'c.','MarkerSize',8);
                    %plot(BBICselectWithCF(m).ThrCF,BBICselectWithCF(m).ThrCF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'r.','MarkerSize',8);
                    N3=[N3 m];    
                end;
            end;
            %end;
    end;
    hold off;
    Nn2=[Nn2 N2];%display(Nn2);
    Nn3=[Nn3 N3];%display(Nn3);
end;

Number2=length(find(Nn2>0));display(Number2);Number3=length(find(Nn3>0));display(Number3);
assignin('base','BBICselectBB3',BBICselectBB3);
clear Dif

%figure7
figure
SIZE=size(BBICselectBB3);
Nn=0;
for k=1:30
    NN=ceil(k/10)-1;
    axes('Position',[(k-NN*10-1)*(1/10)+0.03 1-(NN+1)*(1/3)+0.02 1/10-0.02 1/3-0.02],'FontSize',8);hold on;
    xlabel([num2str((k-13)*0.1) '<=CD<' num2str((k-12)*0.1)],'FontSize',6,'Units','normalized','Position',[0.5,1]);

    N=0;
    for m=1:SIZE(2)
        clear Dif;
        
        clear Diff;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
        %if BBICselectWithCF(m).ThrCF>0
        if (BBICselectBB3(m).CD>=(k-13)*0.1)&(BBICselectBB3(m).CD<(k-12)*0.1)
            %plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'b');axis([0 2000 -2 2]);grid on;hold on
            %plot(0,BBICselectBB3(m).CPr,'b.','MarkerSize',8);axis([0 2000 -2 2]);grid on;hold on
                        
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                    end;
                    bumpM(:,1)=[];
                    %old requirement for bump
                    %modified to any peak or trough
                    %if BBICselectBB3(m).CD>=0
                        [p,q]=max(abs(bumpM(1,:)));maxbumpidx=bumpM(2,q);
                        %else
                        %[p,q]=min(bumpM(1,:));maxbumpidx=bumpM(2,q);
                        %end;
                    BBICselectBB3(m).bumpfreq1=BBICselectBB3(m).sigpX(maxbumpidx);
                    BBICselectBB3(m).bumphight1=Dif(maxbumpidx);
                    %display([BBICselectBB3(m).CD Dif(maxbumpidx)])
                    
                    %Low=BBICselectWithCF(m).DomF*(2^(-1/3));
                    %High=BBICselectWithCF(m).DomF*(2^(1/3));
                    %if Low<=BBICselectWithCF(m).sigpX(maxbumpidx)&BBICselectWithCF(m).sigpX(maxbumpidx)<=High
                    if Dif(maxbumpidx)>0.05|Dif(maxbumpidx)<-0.05
                        plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'r');axis([0 3000 -2 2]);grid on;hold on
                        %plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                        plot(BBICselectBB3(m).VSBF,-1,'r.','MarkerSize',8);
                        plot(BBICselectBB3(m).RateBF,-0.5,'r.','MarkerSize',8);
                        if BBICselectBB3(m).ThrCF>0
                            plot(BBICselectBB3(m).ThrCF,-1.5,'r.','MarkerSize',8);
                        end;
                        %plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'r*','MarkerSize',6);hold on
                    else
                        plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'k');axis([0 3000 -2 2]);grid on;hold on
                        %plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                        plot(BBICselectBB3(m).VSBF,-1.1,'b.','MarkerSize',8);
                        plot(BBICselectBB3(m).RateBF,-0.6,'b.','MarkerSize',8);
                        if BBICselectBB3(m).ThrCF>0
                            plot(BBICselectBB3(m).ThrCF,-1.6,'b.','MarkerSize',8);
                        end;
                        %plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'b*','MarkerSize',6);hold on
                    end;
                    
                    N=[N m];
                    
                else
                    plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'c');axis([0 3000 -2 2]);grid on;hold on
                    %plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                    plot(BBICselectBB3(m).VSBF,-1.2,'c.','MarkerSize',8);
                    plot(BBICselectBB3(m).RateBF,-0.7,'c.','MarkerSize',8);
                    if BBICselectBB3(m).ThrCF>0
                        plot(BBICselectBB3(m).ThrCF,-1.7,'c.','MarkerSize',8);
                    end;
                end;
                
        end;
    end;
    hold off;
    Nn=[Nn N];%display(Nn)
end;
hold off
Number1=length(find(Nn>0));display(Number1)
assignin('base','BBICselectBB3',BBICselectBB3);

%figure8
figure
SIZE=size(BBICselectBB3);
Nn=0;
for k=1:30
    NN=ceil(k/10)-1;
    axes('Position',[(k-NN*10-1)*(1/10)+0.03 1-(NN+1)*(1/3)+0.02 1/10-0.02 1/3-0.02],'FontSize',8);hold on;
    xlabel([num2str((k-13)*0.1) '<=CD<' num2str((k-12)*0.1)],'FontSize',6,'Units','normalized','Position',[0.5,1]);

    N=0;
    for m=1:SIZE(2)
        clear Dif;
        
        clear Diff;
        if (BBICselectBB3(m).CP < -0.5)|(BBICselectBB3(m).CP >= 0.5)
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP-round(BBICselectBB3(m).CP);
        
            Diff=BBICselectBB3(m).CPr-BBICselectBB3(m).CP;
        
            size1=size(BBICselectBB3(m).sigpY);
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY+ones(1,size1(2))*Diff;
        
            size2=size(BBICselectBB3(m).lineY);
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY+ones(1,size2(2))*Diff;
        
        else
            BBICselectBB3(m).CPr=BBICselectBB3(m).CP;
            BBICselectBB3(m).sigpYr=BBICselectBB3(m).sigpY;
            BBICselectBB3(m).lineYr=BBICselectBB3(m).lineY;
        end;
        
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectBB3(m).sigpX.*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr;
        
        Dif=BBICselectBB3(m).sigpYr-LINEY;
        
        %display(m)
        %display(Dif)
        %display(length(Dif)-1)
        clear DifM;clear MM1;clear bump;clear MMM;
        for a=1:(length(Dif)-1)
            if Dif(a)*Dif(a+1)<0
                DifM(a)=1;
            else
                DifM(a)=0;
            end;
        end;
        %display(DifM)
        DifM(length(Dif))=0;
        %display(DifM)
        
        MM1=find(DifM==1);
        
        %display(MM1)
        %display(Dif)
        
        %if BBICselectWithCF(m).ThrCF>0
        if (BBICselectBB3(m).CD>=(k-13)*0.1)&(BBICselectBB3(m).CD<(k-12)*0.1)
            %plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'b');axis([0 2000 -2 2]);grid on;hold on
            %plot(0,BBICselectBB3(m).CPr,'b.','MarkerSize',8);axis([0 2000 -2 2]);grid on;hold on
                        
                if length(MM1)>=2
                    clear bump
                    bumpM=[0;0];
                    for g=1:length(MM1)-1
                        [bumpabs,idx]=max(abs(Dif(MM1(g)+1:MM1(g+1))));
                        
                        bumpidx=MM1(g)+idx;
                        bump=Dif(MM1(g)+idx);
                        bumpM=[bumpM [bump;bumpidx]];
                    end;
                    bumpM(:,1)=[];
                    %new requirement for bump
                    if BBICselectBB3(m).CD>=0
                        candi=find(bumpM(1,:)>=0);bumpM2=bumpM(:,candi);
                        [p,q]=max(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    else
                        candi=find(bumpM(1,:)<0);bumpM2=bumpM(:,candi);
                        [p,q]=min(bumpM2(1,:));maxbumpidx=bumpM2(2,q);
                    end;
                    clear candi;clear bumpM2
                    
                    BBICselectBB3(m).bumpfreq2=BBICselectBB3(m).sigpX(maxbumpidx);
                    BBICselectBB3(m).bumphight2=Dif(maxbumpidx);
                    %display([BBICselectBB3(m).CD Dif(maxbumpidx)])
                    
                    %Low=BBICselectWithCF(m).DomF*(2^(-1/3));
                    %High=BBICselectWithCF(m).DomF*(2^(1/3));
                    %if Low<=BBICselectWithCF(m).sigpX(maxbumpidx)&BBICselectWithCF(m).sigpX(maxbumpidx)<=High
                    if Dif(maxbumpidx)>0.05|Dif(maxbumpidx)<-0.05
                        plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'r');axis([0 3000 -2 2]);grid on;hold on
                        %plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                        plot(BBICselectBB3(m).VSBF,-1,'r.','MarkerSize',8);
                        plot(BBICselectBB3(m).RateBF,-0.5,'r.','MarkerSize',8);
                        if BBICselectBB3(m).ThrCF>0
                            plot(BBICselectBB3(m).ThrCF,-1.5,'r.','MarkerSize',8);
                        end;
                        %plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'r*','MarkerSize',6);hold on
                    else
                        plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'k');axis([0 3000 -2 2]);grid on;hold on
                        %plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                        plot(BBICselectBB3(m).VSBF,-1.1,'b.','MarkerSize',8);
                        plot(BBICselectBB3(m).RateBF,-0.6,'b.','MarkerSize',8);
                        if BBICselectBB3(m).ThrCF>0
                            plot(BBICselectBB3(m).ThrCF,-1.6,'b.','MarkerSize',8);
                        end;
                        %plot(BBICselectBB3(m).ThrCF,BBICselectBB3(m).ThrCF*BBICselectBB3(m).CD/1000+BBICselectBB3(m).CPr,'r.','MarkerSize',8);
                        plot(BBICselectBB3(m).sigpX(maxbumpidx),BBICselectBB3(m).sigpYr(maxbumpidx),'b*','MarkerSize',6);hold on
                    end;
                    
                    N=[N m];
                    
                else
                    plot(BBICselectBB3(m).sigpX,BBICselectBB3(m).sigpYr,'c');axis([0 3000 -2 2]);grid on;hold on
                    %plot(BBICselectBB3(m).lineX,BBICselectBB3(m).lineYr,'k--');
                    plot(BBICselectBB3(m).VSBF,-1.2,'c.','MarkerSize',8);
                    plot(BBICselectBB3(m).RateBF,-0.7,'c.','MarkerSize',8);
                    if BBICselectBB3(m).ThrCF>0
                        plot(BBICselectBB3(m).ThrCF,-1.7,'c.','MarkerSize',8);
                    end;
                end;
                
        end;
    end;
    hold off;
    Nn=[Nn N];%display(Nn)
end;
hold off
Number1=length(find(Nn>0));display(Number1)
assignin('base','BBICselectBB3',BBICselectBB3);

%figure9
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if isempty(BBICselectBB3(m1).bumphight1)==0
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumphight1,'r.','MarkerSize',12);hold on;grid on
            xlabel('CD(ms)');ylabel('bumphight1 (cycle)')
    end;
end;

%figure10
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if isempty(BBICselectBB3(m1).bumphight2)==0
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumphight2,'r.','MarkerSize',12);hold on;grid on
            xlabel('CD(ms)');ylabel('bumphight2 (cycle)')
    end;
end;

%figure11
figure
SIZE=size(BBICselectBB3);
for x=1:SIZE(2)
    if isempty(BBICselectBB3(x).bumpfreq1)==0
        Low=BBICselectBB3(x).DomF*(2^(-1/3));
        High=BBICselectBB3(x).DomF*(2^(1/3));
        if Low<=BBICselectBB3(x).bumpfreq1&BBICselectBB3(x).bumpfreq1<=High
            plot(BBICselectBB3(x).CD,BBICselectBB3(x).bumpfreq1,'mo');grid on;hold on
            xlabel('CD (ms)');ylabel('Bump frequency1 (Hz)')
        else
            plot(BBICselectBB3(x).CD,BBICselectBB3(x).bumpfreq1,'bo');grid on;hold on
            xlabel('CD (ms)');ylabel('Bump frequency1 (Hz)')
        end;
    end;
end;
hold off

%figure12
figure
SIZE=size(BBICselectBB3);
for x=1:SIZE(2)
    if isempty(BBICselectBB3(x).bumpfreq2)==0
        Low=BBICselectBB3(x).DomF*(2^(-1/3));
        High=BBICselectBB3(x).DomF*(2^(1/3));
        if Low<=BBICselectBB3(x).bumpfreq2&BBICselectBB3(x).bumpfreq2<=High
            plot(BBICselectBB3(x).CD,BBICselectBB3(x).bumpfreq2,'mo');grid on;hold on
            xlabel('CD (ms)');ylabel('Bump frequency2 (Hz)')
        else
            plot(BBICselectBB3(x).CD,BBICselectBB3(x).bumpfreq2,'bo');grid on;hold on
            xlabel('CD (ms)');ylabel('Bump frequency2 (Hz)')
        end;
    end;
end;
hold off

%figure13
figure
SIZE=size(BBICselectBB3);
for x=1:SIZE(2)
    if isempty(BBICselectBB3(x).bumpfreq1)==0&isempty(BBICselectBB3(x).DomF)==0
        Low=BBICselectBB3(x).DomF*(2^(-1/3));
        High=BBICselectBB3(x).DomF*(2^(1/3));
        if Low<=BBICselectBB3(x).bumpfreq1&BBICselectBB3(x).bumpfreq1<=High
            plot(BBICselectBB3(x).CD,BBICselectBB3(x).bumpfreq1-BBICselectBB3(x).DomF,'mo');grid on;hold on
            plot(BBICselectBB3(x).CD,abs(BBICselectBB3(x).bumpfreq1-BBICselectBB3(x).DomF),'m*','MarkerSize',4);
            xlabel('CD (ms)');ylabel('Bump frequency1 - DomF (Hz)')
        else
            plot(BBICselectBB3(x).CD,BBICselectBB3(x).bumpfreq1-BBICselectBB3(x).DomF,'bo');grid on;hold on
            plot(BBICselectBB3(x).CD,abs(BBICselectBB3(x).bumpfreq1-BBICselectBB3(x).DomF),'b*','MarkerSize',4);
            xlabel('CD (ms)');ylabel('Bump frequency1 - DomF (Hz)')
        end;
    end;
end;
hold off

%figure14
figure
SIZE=size(BBICselectBB3);
for x=1:SIZE(2)
    if isempty(BBICselectBB3(x).bumpfreq2)==0&isempty(BBICselectBB3(x).DomF)==0
        Low=BBICselectBB3(x).DomF*(2^(-1/3));
        High=BBICselectBB3(x).DomF*(2^(1/3));
        if Low<=BBICselectBB3(x).bumpfreq2&BBICselectBB3(x).bumpfreq2<=High
            plot(BBICselectBB3(x).CD,BBICselectBB3(x).bumpfreq2-BBICselectBB3(x).DomF,'mo');grid on;hold on
            plot(BBICselectBB3(x).CD,abs(BBICselectBB3(x).bumpfreq2-BBICselectBB3(x).DomF),'m*','MarkerSize',4);
            xlabel('CD (ms)');ylabel('Bump frequency2 - DomF (Hz)')
        else
            plot(BBICselectBB3(x).CD,BBICselectBB3(x).bumpfreq2-BBICselectBB3(x).DomF,'bo');grid on;hold on
            plot(BBICselectBB3(x).CD,abs(BBICselectBB3(x).bumpfreq2-BBICselectBB3(x).DomF),'b*','MarkerSize',4);
            xlabel('CD (ms)');ylabel('Bump frequency2 - DomF (Hz)')
        end;
    end;
end;
hold off

%figure15
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if isempty(BBICselectBB3(m1).bumphight1)==0
        plot(BBICselectBB3(m1).bumphight1,BBICselectBB3(m1).CD,'r.','MarkerSize',12);hold on;grid on
        plot(BBICselectBB3(m1).bumphight1,BBICselectBB3(m1).CPr,'b.','MarkerSize',12);hold on
        xlabel('bumphight1 (cycle)');ylabel('red:CD blue:CPr')
    else
        plot(-0.005,BBICselectBB3(m1).CD,'ro');hold on;grid on
        plot(0,BBICselectBB3(m1).CPr,'bo');hold on
        xlabel('bumphight1 (cycle)');ylabel('red:CD blue:CPr')
    end;
end;

%figure16
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if isempty(BBICselectBB3(m1).bumphight2)==0
        plot(BBICselectBB3(m1).bumphight2,BBICselectBB3(m1).CD,'r.','MarkerSize',12);hold on;grid on
        plot(BBICselectBB3(m1).bumphight2,BBICselectBB3(m1).CPr,'b.','MarkerSize',12);hold on
        xlabel('bumphight2 (cycle)');ylabel('red:CD blue:CPr')
    else
        plot(-0.005,BBICselectBB3(m1).CD,'ro');hold on;grid on
        plot(0,BBICselectBB3(m1).CPr,'bo');hold on
        xlabel('bumphight2 (cycle)');ylabel('red:CD blue:CPr')
    end;
end;

%figure17
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if BBICselectBB3(m1).bumphight1>0.05|BBICselectBB3(m1).bumphight1<-0.05
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumpfreq1,'r.','MarkerSize',12);hold on;grid on
        xlabel('CD(ms)');ylabel('bumpfrequency1 (Hz)')
    elseif BBICselectBB3(m1).bumphight1>-0.05&BBICselectBB3(m1).bumphight1<0.05
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumpfreq1,'b.','MarkerSize',12);hold on;grid on
        xlabel('CD(ms)');ylabel('bumpfrequency1 (Hz)')
    end;
end;

%figure18
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if BBICselectBB3(m1).bumphight2>0.05|BBICselectBB3(m1).bumphight2<-0.05
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumpfreq2,'r.','MarkerSize',12);hold on;grid on
        xlabel('CD(ms)');ylabel('bumpfrequency2 (Hz)')
    elseif BBICselectBB3(m1).bumphight2>-0.05&BBICselectBB3(m1).bumphight2<0.05
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumpfreq2,'b.','MarkerSize',12);hold on;grid on
        xlabel('CD(ms)');ylabel('bumpfrequency2 (Hz)')
    end;
end;

%figure19
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if BBICselectBB3(m1).bumphight1>0.05|BBICselectBB3(m1).bumphight1<-0.05
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumpfreq1-BBICselectBB3(m1).DomF,'r.','MarkerSize',12);hold on;grid on
        xlabel('CD(ms)');ylabel('bumpfrequency1-DomF (Hz)')
    elseif BBICselectBB3(m1).bumphight1>-0.05&BBICselectBB3(m1).bumphight1<0.05
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumpfreq1-BBICselectBB3(m1).DomF,'b.','MarkerSize',12);hold on;grid on
        xlabel('CD(ms)');ylabel('bumpfrequency1-DomF (Hz)')
    end;
end;

%figure20
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if BBICselectBB3(m1).bumphight2>0.05|BBICselectBB3(m1).bumphight2<-0.05
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumpfreq2-BBICselectBB3(m1).DomF,'r.','MarkerSize',12);hold on;grid on
        xlabel('CD(ms)');ylabel('bumpfrequency2-DomF (Hz)')
    elseif BBICselectBB3(m1).bumphight2>-0.05&BBICselectBB3(m1).bumphight2<0.05
        plot(BBICselectBB3(m1).CD,BBICselectBB3(m1).bumpfreq2-BBICselectBB3(m1).DomF,'b.','MarkerSize',12);hold on;grid on
        xlabel('CD(ms)');ylabel('bumpfrequency2-DomF (Hz)')
    end;
end;

%figure21
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if isempty(BBICselectBB3(m1).bumphight1)==0
        if BBICselectBB3(m1).ThrCF>0
            plot(BBICselectBB3(m1).bumphight1,BBICselectBB3(m1).RateBF-BBICselectBB3(m1).ThrCF,'r.','MarkerSize',12);hold on;grid on
            plot(BBICselectBB3(m1).bumphight1,BBICselectBB3(m1).VSBF-BBICselectBB3(m1).ThrCF,'b.','MarkerSize',12);hold on
            plot(BBICselectBB3(m1).bumphight1,BBICselectBB3(m1).DomF-BBICselectBB3(m1).ThrCF,'c.','MarkerSize',12);hold on
            xlabel('bumphight1 (cycle)');ylabel('red:RateBF-ThrCF blue:VSBF-ThrCF cyan:DomF-ThrCF')
        end;
    else
        if BBICselectBB3(m1).ThrCF>0
            plot(-0.005,BBICselectBB3(m1).RateBF-BBICselectBB3(m1).ThrCF,'ro');hold on;grid on
            plot(0,BBICselectBB3(m1).VSBF-BBICselectBB3(m1).ThrCF,'bo');hold on
            plot(0.005,BBICselectBB3(m1).DomF-BBICselectBB3(m1).ThrCF,'co');hold on
            xlabel('bumphight1 (cycle)');ylabel('red:RateBF-ThrCF blue:VSBF-ThrCF cyan:DomF-ThrCF')
        end;
    end;
end;
hold off;

%figure22
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if isempty(BBICselectBB3(m1).bumphight2)==0
        if BBICselectBB3(m1).ThrCF>0
            plot(BBICselectBB3(m1).bumphight2,BBICselectBB3(m1).RateBF-BBICselectBB3(m1).ThrCF,'r.','MarkerSize',12);hold on;grid on
            plot(BBICselectBB3(m1).bumphight2,BBICselectBB3(m1).VSBF-BBICselectBB3(m1).ThrCF,'b.','MarkerSize',12);hold on
            plot(BBICselectBB3(m1).bumphight2,BBICselectBB3(m1).DomF-BBICselectBB3(m1).ThrCF,'c.','MarkerSize',12);hold on
            xlabel('bumphight2 (cycle)');ylabel('red:RateBF-ThrCF blue:VSBF-ThrCF cyan:DomF-ThrCF')
        end;
    else
        if BBICselectBB3(m1).ThrCF>0
            plot(-0.005,BBICselectBB3(m1).RateBF-BBICselectBB3(m1).ThrCF,'ro');hold on;grid on
            plot(0,BBICselectBB3(m1).VSBF-BBICselectBB3(m1).ThrCF,'bo');hold on
            plot(0.005,BBICselectBB3(m1).DomF-BBICselectBB3(m1).ThrCF,'co');hold on
            xlabel('bumphight2 (cycle)');ylabel('red:RateBF-ThrCF blue:VSBF-ThrCF cyan:DomF-ThrCF')
        end;
    end;
end;
hold off;

%figure23
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if isempty(BBICselectBB3(m1).bumphight1)==0
        plot(BBICselectBB3(m1).bumphight1,BBICselectBB3(m1).RateBF-BBICselectBB3(m1).VSBF,'r.','MarkerSize',12);hold on;grid on
        plot(BBICselectBB3(m1).bumphight1,BBICselectBB3(m1).VSBF-BBICselectBB3(m1).DomF,'b.','MarkerSize',12);hold on
        plot(BBICselectBB3(m1).bumphight1,BBICselectBB3(m1).DomF-BBICselectBB3(m1).RateBF,'c.','MarkerSize',12);hold on
        xlabel('bumphight1 (cycle)');ylabel('red:RateBF-VSBF blue:VSBF-DomF cyan:DomF-RateBF')
    else
        plot(-0.005,BBICselectBB3(m1).RateBF-BBICselectBB3(m1).VSBF,'ro');hold on;grid on
        plot(0,BBICselectBB3(m1).VSBF-BBICselectBB3(m1).DomF,'bo');hold on
        plot(0.005,BBICselectBB3(m1).DomF-BBICselectBB3(m1).RateBF,'co');hold on
        xlabel('bumphight1 (cycle)');ylabel('red:RateBF-VSBF blue:VSBF-DomF cyan:DomF-RateBF')
    end;
end;

%figure24
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if isempty(BBICselectBB3(m1).bumphight2)==0
        plot(BBICselectBB3(m1).bumphight2,BBICselectBB3(m1).RateBF-BBICselectBB3(m1).VSBF,'r.','MarkerSize',12);hold on;grid on
        plot(BBICselectBB3(m1).bumphight2,BBICselectBB3(m1).VSBF-BBICselectBB3(m1).DomF,'b.','MarkerSize',12);hold on
        plot(BBICselectBB3(m1).bumphight2,BBICselectBB3(m1).DomF-BBICselectBB3(m1).RateBF,'c.','MarkerSize',12);hold on
        xlabel('bumphight2 (cycle)');ylabel('red:RateBF-VSBF blue:VSBF-DomF cyan:DomF-RateBF')
    else
        plot(-0.005,BBICselectBB3(m1).RateBF-BBICselectBB3(m1).VSBF,'ro');hold on;grid on
        plot(0,BBICselectBB3(m1).VSBF-BBICselectBB3(m1).DomF,'bo');hold on
        plot(0.005,BBICselectBB3(m1).DomF-BBICselectBB3(m1).RateBF,'co');hold on
        xlabel('bumphight2 (cycle)');ylabel('red:RateBF-VSBF blue:VSBF-DomF cyan:DomF-RateBF')
    end;
end;


%figure25
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    if BBICselectBB3(m1).ThrCF>0
        Blue=find(BBICselectBB3(m1).sigmX<=BBICselectBB3(m1).ThrCF);
        Red=find(BBICselectBB3(m1).sigmX>BBICselectBB3(m1).ThrCF);
        if isempty(Blue)==0&isempty(Red)==0
            plot(BBICselectBB3(m1).sigmX(Blue),BBICselectBB3(m1).sigmY(Blue),'b-');hold on;grid on
            plot(BBICselectBB3(m1).sigmX(Red),BBICselectBB3(m1).sigmY(Red),'b-');hold on;grid on
            xlabel('Tone frequency (Hz)');ylabel('Vector strength')
        else
            plot(BBICselectBB3(m1).sigmX(Blue),BBICselectBB3(m1).sigmY(Blue),'b-');hold on;grid on
            plot(BBICselectBB3(m1).sigmX(Red),BBICselectBB3(m1).sigmY(Red),'b-');hold on;grid on
            xlabel('Tone frequency (Hz)');ylabel('Vector strength')
        end;
        clear Blue;clear Red;
    else
        plot(BBICselectBB3(m1).sigmX,BBICselectBB3(m1).sigmY,'k');hold on;grid on
        xlabel('Tone frequency (Hz)');ylabel('Vector strength')
    end;
end;

%figure26
figure
SIZE=size(BBICselectBB3);
for m1=1:SIZE(2)
    [MaxSigmY,MaxSigmI]=max(BBICselectBB3(m1).sigmY);
    if BBICselectBB3(m1).ThrCF>0
        plot(BBICselectBB3(m1).sigmX(MaxSigmI),BBICselectBB3(m1).sigmY(MaxSigmI),'bo','MarkerSize',12);hold on;grid on
        if BBICselectBB3(m1).ThrCF>BBICselectBB3(m1).sigmX(MaxSigmI)
            plot(BBICselectBB3(m1).ThrCF,BBICselectBB3(m1).sigmY(MaxSigmI),'r*');hold on;grid on
            line([BBICselectBB3(m1).sigmX(MaxSigmI) BBICselectBB3(m1).ThrCF],[BBICselectBB3(m1).sigmY(MaxSigmI) BBICselectBB3(m1).sigmY(MaxSigmI)],'Color','r');hold on;grid on
            xlabel('Tone frequency (Hz) Red:higher ThrCF Cyan:lower ThrCF');ylabel('Maximal vector strength')
        else
            plot(BBICselectBB3(m1).ThrCF,BBICselectBB3(m1).sigmY(MaxSigmI),'c*');hold on;grid on
            line([BBICselectBB3(m1).sigmX(MaxSigmI) BBICselectBB3(m1).ThrCF],[BBICselectBB3(m1).sigmY(MaxSigmI) BBICselectBB3(m1).sigmY(MaxSigmI)],'Color','c');hold on;grid on
            xlabel('Tone frequency (Hz) Red:higher ThrCF Cyan:lower ThrCF');ylabel('Maximal vector strength')
        end;
    else
        plot(BBICselectBB3(m1).sigmX(MaxSigmI),BBICselectBB3(m1).sigmY(MaxSigmI),'k.','MarkerSize',24);hold on;grid on
        xlabel('Tone frequency (Hz) Red:higher ThrCF Cyan:lower ThrCF');ylabel('Maximal vector strength')
    end;
    clear MaxSigmY;clear MaxSigmI;
end;





