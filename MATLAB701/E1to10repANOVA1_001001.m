% E1to10repANOVA1_001001
function SigChN4=E1to10repANOVA1_001001(BB4,BB6,BBN,V)
P4((1:123),203)=([BB4((1:123),203,1)])';
P4((1:7),(1:202))=ones(7,202);
P4((117:123),(1:202))=ones(7,202);
%
P6((1:123),203)=([BB6((1:123),203,1)])';
P6((1:7),(1:202))=ones(7,202);
P6((117:123),(1:202))=ones(7,202);
%
for C=1:202
    for f=8:116
        if repANOVA1([squeeze(BB4(f,C,:)) squeeze(BB6(f,C,:)) squeeze(BBN(f,C,:))])>=0.01
            P4(f,C)=1;
            P6(f,C)=1;
        else
            if (mean(BB4(f,C,:),3)>mean(BBN(f,C,:),3))&(mean(BB4(f,C,:),3)>mean(BB6(f,C,:),3))
            [H,p,ci]=ttest(BB4(f,C,:),BBN(f,C,:));
                if p<0.01
                    [H,P4(f,C),ci]=ttest(BB4(f,C,:),BB6(f,C,:));
                else
                    P4(f,C)=1;
                end;
            elseif (mean(BB6(f,C,:),3)>mean(BBN(f,C,:),3))&(mean(BB6(f,C,:),3)>mean(BB4(f,C,:),3))
                [H,p,ci]=ttest(BB6(f,C,:),BBN(f,C,:));
                if p<0.01
                    [H,P6(f,C),ci]=ttest(BB6(f,C,:),BB4(f,C,:));
                else
                    P6(f,C)=1;
                end;
            else
                P6(f,C)=1;
                P4(f,C)=1;
            end;
        end;
    end;
end;
SigChN4(1:7)=[0 0 0 0 0 0 0];
SigChN4(117:123)=[0 0 0 0 0 0 0];
for F=8:116
    SigChN4(F)=sum(P4(F,(1:202))<0.01);
end;
Plot4P=[[P4;V] [SigChN4 0 0 0 0]'];
assignin('base','Plot4P',Plot4P);
%
SigChN6(1:7)=[0 0 0 0 0 0 0];
SigChN6(117:123)=[0 0 0 0 0 0 0];
for G=8:116
    SigChN6(G)=sum(P6(G,(1:202))<0.01);
end;
Plot6P=[[P6;V] [SigChN6 0 0 0 0]'];
assignin('base','Plot6P',Plot6P);
%
[i,j]=find(Plot4P((1:123),(1:202))<0.01);
X=[i j];
for k=1:size(X,1)
    if Plot4P(125,X(k,2))>0
        subplot(2,1,1);plot3(Plot4P(126,X(k,2)),Plot4P(127,X(k,2)),Plot4P(X(k,1),203),'bo','MarkerSize',4,'LineWidth',1),axis([-60 60 -60 60 1 10]),hold on,view([0 0]);
        subplot(2,1,2);plot3(Plot4P(126,X(k,2)),Plot4P(127,X(k,2)),Plot4P(X(k,1),203),'bo','MarkerSize',4,'LineWidth',1),axis([-60 60 -60 60 1 10]),hold on,view([0 90]);
    else
        subplot(2,1,1);plot3(Plot4P(126,X(k,2)),Plot4P(127,X(k,2)),Plot4P(X(k,1),203),'bs','MarkerSize',4,'LineWidth',0.5),axis([-60 60 -60 60 1 10]),hold on,view([0 0]),axis square;
        subplot(2,1,2);plot3(Plot4P(126,X(k,2)),Plot4P(127,X(k,2)),Plot4P(X(k,1),203),'bs','MarkerSize',4,'LineWidth',0.5),axis([-60 60 -60 60 1 10]),hold on,view([0 90]),axis square;
    end;
end;
%
[I,J]=find(Plot6P((1:123),(1:202))<0.01);
Y=[I J];
for K=1:size(Y,1)
    if Plot6P(125,Y(K,2))>0
        subplot(2,1,1);plot3(Plot6P(126,Y(K,2)),Plot6P(127,Y(K,2)),Plot6P(Y(K,1),203),'ro','MarkerSize',4,'LineWidth',1),axis([-60 60 -60 60 1 10]),hold on,view([0 0]),axis square;
        subplot(2,1,2);plot3(Plot6P(126,Y(K,2)),Plot6P(127,Y(K,2)),Plot6P(Y(K,1),203),'ro','MarkerSize',4,'LineWidth',1),axis([-60 60 -60 60 1 10]),hold on,view([0 90]),axis square;
    else
        subplot(2,1,1);plot3(Plot6P(126,Y(K,2)),Plot6P(127,Y(K,2)),Plot6P(Y(K,1),203),'rs','MarkerSize',3,'LineWidth',0.5),axis([-60 60 -60 60 1 10]),hold on,view([0 0]),axis square;
        subplot(2,1,2);plot3(Plot6P(126,Y(K,2)),Plot6P(127,Y(K,2)),Plot6P(Y(K,1),203),'rs','MarkerSize',3,'LineWidth',0.5),axis([-60 60 -60 60 1 10]),hold on,view([0 90]),axis square;
    end;
end;
%
subplot(2,1,2);plot3(Plot4P(126,find(Plot4P(125,(1:202))>0)),Plot4P(127,find(Plot4P(125,(1:202))>0)),ones(nnz(Plot4P(125,(1:202))>0)),'ko','MarkerSize',2,'LineWidth',0.2),axis([-60 60 -70 70 1 10]),hold on,view([0 90]),axis square;
subplot(2,1,2);plot3(Plot4P(126,find(Plot4P(125,(1:202))==0)),Plot4P(127,find(Plot4P(125,(1:202))==0)),ones(nnz(Plot4P(125,(1:202))==0)),'k.','MarkerSize',2,'LineWidth',0.2),axis([-60 60 -70 70 1 10]),hold on,view([0 90]),axis square;          
end
