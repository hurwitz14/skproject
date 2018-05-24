%DIFCOR

figure100=figure(100);

figure1=figure(1);
s1=subplot(4,6,1);
set(0,'CurrentFigure',figure100);ds=dataset('G0886','7-5-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s1);plot(G0886_7_5difcorX,G0886_7_5difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0886','7-6-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s1);plot(G0886_7_6difcorX,G0886_7_6difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0886 7');

s2=subplot(4,6,2);
set(0,'CurrentFigure',figure100);ds=dataset('G0890','5-10-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s2);plot(G0890_5_10difcorX,G0890_5_10difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','5-11-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s2);plot(G0890_5_11difcorX,G0890_5_11difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','5-12-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s2);plot(G0890_5_12difcorX,G0890_5_12difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','5-13-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s2);plot(G0890_5_13difcorX,G0890_5_13difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','5-14-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s2);plot(G0890_5_14difcorX,G0890_5_14difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','5-15-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s2);plot(G0890_5_15difcorX,G0890_5_15difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','5-16-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s2);plot(G0890_5_16difcorX,G0890_5_16difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0890 5');

s3=subplot(4,6,3);
set(0,'CurrentFigure',figure100);ds=dataset('G0890','6-5-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s3);plot(G0890_6_5difcorX,G0890_6_5difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','6-9-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s3);plot(G0890_6_9difcorX,G0890_6_9difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','6-10-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s3);plot(G0890_6_10difcorX,G0890_6_10difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','6-11-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s3);plot(G0890_6_11difcorX,G0890_6_11difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','6-12-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s3);plot(G0890_6_12difcorX,G0890_6_12difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0890 6');

s4=subplot(4,6,4);
set(0,'CurrentFigure',figure100);ds=dataset('G0890','14-6-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s4);plot(G0890_14_6difcorX,G0890_14_6difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','14-7-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s4);plot(G0890_14_7difcorX,G0890_14_7difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','14-8-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s4);plot(G0890_14_8difcorX,G0890_14_8difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','14-9-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s4);plot(G0890_14_9difcorX,G0890_14_9difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0890','14-12-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s4);plot(G0890_14_12difcorX,G0890_14_12difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0890 14');

s5=subplot(4,6,5);
set(0,'CurrentFigure',figure100);ds=dataset('G0891','8-6-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s5);plot(G0891_8_6difcorX,G0891_8_6difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0891','8-7-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s5);plot(G0891_8_7difcorX,G0891_8_7difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0891 8');

s6=subplot(4,6,6);
set(0,'CurrentFigure',figure100);ds=dataset('G0897','6-4-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s6);plot(G0897_6_4difcorX,G0897_6_4difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0897','6-8-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s6);plot(G0897_6_8difcorX,G0897_6_8difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0897','6-9-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s6);plot(G0897_6_9difcorX,G0897_6_9difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0897 6');

s7=subplot(4,6,7);
set(0,'CurrentFigure',figure100);ds=dataset('G0897','12-5-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s7);plot(G0897_12_5difcorX,G0897_12_5difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0897 12');

s8=subplot(4,6,8);
set(0,'CurrentFigure',figure100);ds=dataset('G0899','2-7-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s8);plot(G0899_2_7difcorX,G0899_2_7difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','2-8-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s8);plot(G0899_2_8difcorX,G0899_2_8difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','2-9-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s8);plot(G0899_2_9difcorX,G0899_2_9difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','2-10-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s8);plot(G0899_2_10difcorX,G0899_2_10difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','2-11-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s8);plot(G0899_2_11difcorX,G0899_2_11difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','2-12-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s8);plot(G0899_2_12difcorX,G0899_2_12difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0899 2');

s9=subplot(4,6,9);
set(0,'CurrentFigure',figure100);ds=dataset('G0899','5-7-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s9);plot(G0899_5_7difcorX,G0899_5_7difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','5-8-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s9);plot(G0899_5_8difcorX,G0899_5_8difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','5-9-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s9);plot(G0899_5_9difcorX,G0899_5_9difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','5-10-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s9);plot(G0899_5_10difcorX,G0899_5_10difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0899 5');

s10=subplot(4,6,10);
set(0,'CurrentFigure',figure100);ds=dataset('G0899','6-7-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s10);plot(G0899_6_7difcorX,G0899_6_7difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','6-8-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s10);plot(G0899_6_8difcorX,G0899_6_8difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','6-9-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s10);plot(G0899_6_9difcorX,G0899_6_9difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0899','6-10-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s10);plot(G0899_6_10difcorX,G0899_6_10difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0899 6');

s11=subplot(4,6,11);
set(0,'CurrentFigure',figure100);ds=dataset('G0901','3-6-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s11);plot(G0901_3_6difcorX,G0901_3_6difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0901','3-7-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s11);plot(G0901_3_7difcorX,G0901_3_7difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0901','3-8-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s11);plot(G0901_3_8difcorX,G0901_3_8difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0901 3');

s12=subplot(4,6,12);
set(0,'CurrentFigure',figure100);ds=dataset('G0903','1-4-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s12);plot(G0903_1_4difcorX,G0903_1_4difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0903','1-5-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s12);plot(G0903_1_5difcorX,G0903_1_5difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G0903','1-6-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s12);plot(G0903_1_6difcorX,G0903_1_6difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G0903 1');

s13=subplot(4,6,13);
set(0,'CurrentFigure',figure100);ds=dataset('G08109','1-4-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s13);plot(G08109_1_4difcorX,G08109_1_4difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G08109','1-5-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s13);plot(G08109_1_5difcorX,G08109_1_5difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G08109 1');

s14=subplot(4,6,14);
set(0,'CurrentFigure',figure100);ds=dataset('G08109','4-4-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s14);plot(G08109_4_4difcorX,G08109_4_4difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G08109','4-5-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s14);plot(G08109_4_5difcorX,G08109_4_5difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G08109 4');

s15=subplot(4,6,15);
set(0,'CurrentFigure',figure100);ds=dataset('G08109','5-4-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s15);plot(G08109_5_4difcorX,G08109_5_4difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G08109 5');

s16=subplot(4,6,16);
set(0,'CurrentFigure',figure100);ds=dataset('G08109','6-4-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s16);plot(G08109_6_4difcorX,G08109_6_4difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G08109','6-5-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s16);plot(G08109_6_5difcorX,G08109_6_5difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G08109 6');

s17=subplot(4,6,17);
set(0,'CurrentFigure',figure100);ds=dataset('G08110','2-6-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s17);plot(G08110_2_6difcorX,G08110_2_6difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G08110','2-7-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s17);plot(G08110_2_7difcorX,G08110_2_7difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G08110 2');

s18=subplot(4,6,18);
set(0,'CurrentFigure',figure100);ds=dataset('G08111','3-6-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s18);plot(G08111_3_6difcorX,G08111_3_6difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G08111 3');

s19=subplot(4,6,19);
set(0,'CurrentFigure',figure100);ds=dataset('G08117','1-4-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s19);plot(G08117_1_4difcorX,G08117_1_4difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G08117 1');

s20=subplot(4,6,20);
set(0,'CurrentFigure',figure100);ds=dataset('G08119','7-4-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s20);plot(G08119_7_4difcorX,G08119_7_4difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G08119','7-5-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s20);plot(G08119_7_5difcorX,G08119_7_5difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold on;
set(0,'CurrentFigure',figure100);ds=dataset('G08119','7-6-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s20);plot(G08119_7_6difcorX,G08119_7_6difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G08119 7');

s21=subplot(4,6,21);
set(0,'CurrentFigure',figure100);ds=dataset('G08119','8-4-NRHO');T = EvalSACXACfigure(ds, [+1, -1], 'anwin', [50 1000]);close;...
    set(0,'CurrentFigure',figure1);set(figure1,'CurrentAxes',s21);plot(G08119_8_4difcorX,G08119_8_4difcorY(1,:),...
    'Color', [1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100 1-ds.stim.StimParam.SPL/100],'LineWidth', 1); hold off;
title('G08119 8');





























