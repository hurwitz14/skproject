SIZE=size(BBICselectWithCF);
BBICselectWithCF_S=BBICselectWithCF;
for k=1:44
    NN=ceil(k/10)-1;
    axes('Position',[(k-NN*10-1)*(1/10)+0.02 NN*(1/5)+0.02 1/10-0.02 1/5-0.02],'FontSize',8);hold on;
    for m=1:SIZE(2)
        clear Dif;
        %making a vector of difference between curve and line with CD&CP
        LINEY=BBICselectWithCF(m).sigpX.*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr;
        Dif=BBICselectWithCF(m).sigpY-LINEY;
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
        if length(MM1)>=2
            for g=1:length(MM1)-1
                
        %display(MM1)
        %display(Dif)
        
        if BBICselectWithCF(m).ThrCF~=[]
            Low=BBICselectWithCF(m).ThrCF*(2^(-1/3));
            High=BBICselectWithCF(m).ThrCF*(2^(1/3));
            
            if (BBICselectWithCF(m).ThrCF>=(k-1)*50)&(BBICselectWithCF(m).ThrCF<k*50)
                plot(BBICselectWithCF(m).sigpX,BBICselectWithCF(m).sigpYr,'b');axis([0 4000 -2 2]);grid on;hold on
                plot(BBICselectWithCF(m).lineX,BBICselectWithCF(m).lineYr,'k--');
                plot(BBICselectWithCF(m).DomF,BBICselectWithCF(m).DomF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'g.','MarkerSize',8);
                plot(BBICselectWithCF(m).RateBF,BBICselectWithCF(m).RateBF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'c.','MarkerSize',8);
                plot(BBICselectWithCF(m).ThrCF,BBICselectWithCF(m).ThrCF*BBICselectWithCF(m).CD/1000+BBICselectWithCF(m).CPr,'r.','MarkerSize',8);
                if length(MM1)>=2
                    clear bump
                    %range=BBICselectWithCF(m).sigpX(min(MM1)+1:max(MM1));
                    if Low<=BBICselectWithCF(m).sigpX(min(MM1)+1)&BBICselectWithCF(m).sigpX(max(MM1))<=High
                        bump=Dif(min(MM1)+1:max(MM1));display(bump);disp('e1')
                    elseif Low<=BBICselectWithCF(m).sigpX(min(MM1)+1)&High<BBICselectWithCF(m).sigpX(max(MM1))
                        bump=Dif(min(MM1)+1:(max(find(BBICselectWithCF(m).sigpX<=High))));display(bump);disp('e2')
                    elseif BBICselectWithCF(m).sigpX(min(MM1)+1)<Low&BBICselectWithCF(m).sigpX(max(MM1))<=High
                        bump=Dif((min(find(BBICselectWithCF(m).sigpX>=Low))):max(MM1));display(bump);disp('e3')
                    elseif BBICselectWithCF(m).sigpX(min(MM1)+1)<Low&High<BBICselectWithCF(m).sigpX(max(MM1))
                        bump=Dif((min(find(BBICselectWithCF(m).sigpX>Low))):(max(find(BBICselectWithCF(m).sigpX<High))));display(bump);disp('e4')
                    else
                        bump=[];
                    end;
                    %bump=Dif(min(MM1)+1:max(MM1));
                    
                    
                    if isempty(bump)==0
                        %display(bump)
                        MMM=max(abs(bump));
                        display(MMM)
                        display(Dif)
                        display(m)
                        d=find(abs(Dif)==MMM);
                        BBICselectWithCF_S(m).maxbumpidx=d;
                        BBICselectWithCF_S(m).maxbump=Dif(d);
                        
                    else
                        BBICselectWithCF_S(m).maxbumpidx=0;
                        BBICselectWithCF_S(m).maxbump=0;
                    end;
                else
                    BBICselectWithCF_S(m).maxbumpidx=0;
                    BBICselectWithCF_S(m).maxbump=0;
                end;
                if BBICselectWithCF_S(m).maxbumpidx>0
                    plot(BBICselectWithCF(m).sigpX(BBICselectWithCF_S(m).maxbumpidx),BBICselectWithCF(m).sigpY(BBICselectWithCF_S(m).maxbumpidx),'m*','MarkerSize',6);
                end;
            else
                BBICselectWithCF_S(m).maxbumpidx=0;
                BBICselectWithCF_S(m).maxbump=0;
            end;
        else
            BBICselectWithCF_S(m).maxbumpidx=0;
            BBICselectWithCF_S(m).maxbump=0;
            
        end;
        
    end;
    hold off;
end;
assignin('base','BBICselectWithCF_S',BBICselectWithCF_S)

