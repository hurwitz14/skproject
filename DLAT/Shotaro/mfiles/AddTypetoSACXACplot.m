S=sacxac585typeAB1000(1);
for n=1:length(sacxac585typeAB1000)
    
    if nnz(sacxac585typeAB1000(n).ConfidenceLevel<1)==0 %& max(sacxac585typeAB1000(n).rate)>10
        S=[S;sacxac585typeAB1000(n)];
    end;
end;
L=length(S);
S=S(2:L);

for k=1:length(S)
    S(k).maxrate=max(S(k).rate);
    S(k).minrate=min(S(k).rate);
end;

S_PHL=structfilter(S,'strcmp($PSTHtypeCF$,''PHL'')');
S_PLN=structfilter(S,'strcmp($PSTHtypeCF$,''PLN'')');
S_PL=structfilter(S,'strcmp($PSTHtypeCF$,''PL'')');
S_C=structfilter(S,'strcmp($PSTHtypeCF$,''C'')');
S_O=structfilter(S,'strcmp($PSTHtypeCF$,''O'')');
S_Oi=structfilter(S,'strcmp($PSTHtypeCF$,''Oi'')');
S_OL=structfilter(S,'strcmp($PSTHtypeCF$,''OL'')');
S_Oc=structfilter(S,'strcmp($PSTHtypeCF$,''Oc'')');
S_X=structfilter(S,'strcmp($PSTHtypeCF$,''X'')');
S_HITH=structfilter(S,'strcmp($PSTHtypeCF$,''HITH'')');

structplot(...
    S_PLN,'CF','ac.max',...
    ...
    S_C,'CF','ac.max',...
    S_O,'CF','ac.max',...
    S_Oi,'CF','ac.max',...
    S_OL,'CF','ac.max',...
    ...
    S_X,'CF','ac.max',...
    'markers',{'^','*','s','s','s','x'}, 'Colors',{'k','k','k','b','g','k'})

structplot(...
    S_PLN,'CF','diff.max',...
    ...
    S_C,'CF','diff.max',...
    S_O,'CF','diff.max',...
    S_Oi,'CF','diff.max',...
    S_OL,'CF','diff.max',...
    ...
    S_X,'CF','diff.max',...
    'markers',{'^','*','s','s','s','x'}, 'Colors',{'k','k','k','b','g','k'})

structplot(...
    S_PLN,'CF','minrate',...
    ...
    S_C,'CF','minrate',...
    S_O,'CF','minrate',...
    S_Oi,'CF','minrate',...
    S_OL,'CF','minrate',...
    ...
    S_X,'CF','minrate',...
    'markers',{'^','*','s','s','s','x'}, 'Colors',{'k','k','k','b','g','k'})

structplot(...
    S_PLN,'CF','diff.fft.df',...
    ...
    S_C,'CF','diff.fft.df',...
    S_O,'CF','diff.fft.df',...
    S_Oi,'CF','diff.fft.df',...
    S_OL,'CF','diff.fft.df',...
    ...
    S_X,'CF','diff.fft.df',...
    'markers',{'^','*','s','s','s','x'}, 'Colors',{'k','k','k','b','g','k'})




