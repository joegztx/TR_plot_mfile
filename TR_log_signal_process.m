clc
clear

%fpn='E:\Ray_Works\Test_Trending\SJZL2_Commissioning_data\2020-5-5-03车LCB不能闭合信号列表和TR\02003车MP2-LCB不能闭合TR';% main file folder path 
%fpn='E:\Ray_Works\Test_Trending\SJZL2_Commissioning_data\2020-5-6-03车LCB不能闭合信号列表和TR\02003车M2-LCB不能闭合TR';% main file folder path 
%fpn=uigetdir('select the parent folder of trending files');
%fpn='E:\Ray_Works\Test_Trending\SJZL2_Commissioning_data\2020-4-28-02004车电机相位过流TR\02004 M1_mc_over_currentTR2020.4.28';
%fpn='E:\Ray_Works\Test_Trending\SJZL2_Commissioning_data\2020-4-27-02004Brake_resistor_DI_OverTemp_TR\02004Brake_resistor_DI_OverTemp_TR';
fpn='C:\Users\ray\Desktop\02003M1_2020-5-5 to 5-10 TR';
%fpn='C:\Users\ray\Desktop\2020-5-14-02004-VLU-Short-Circuit-TR-2020.5.14\2020-5-14-02004-VLU-Short-Circuit-TR';
% subsub folder
fs_a1=foldercheck([fpn,'\TranRec_A1']);% file struct
fs_a2=foldercheck([fpn,'\TranRec_A2']);% file struct
fs_b1=foldercheck([fpn,'\TranRec_B1']);% file struct
fs_b2=foldercheck([fpn,'\TranRec_B2']);% file struct
fs_b3=foldercheck([fpn,'\TranRec_B3']);% file struct
%fs_c1=foldercheck([fpn,'\TranRec_C1']);% file struct
fs_c2=foldercheck([fpn,'\TranRec_C2']);% file struct
fs_d1=foldercheck([fpn,'\TranRec_D1']);% file struct
fs_p=foldercheck([fpn,'\TranRec_P']);% file struct
fs_u=foldercheck([fpn,'\TranRec_U']);% file struct
fs_v=foldercheck([fpn,'\TranRec_V']);% file struct
fs_w=foldercheck([fpn,'\TranRec_W']);% file struct

%number of subsubfolder
n=length(fs_a1);

%chosen number of subsubfolder
m=2;
trig_ts_A1=fs_a1(m).name;% trig time string
trig_ts_A2=fs_a2(m).name;% trig time string
trig_ts_B1=fs_b1(m).name;% trig time string
trig_ts_B2=fs_b2(m).name;% trig time string
trig_ts_B3=fs_b3(m).name;% trig time string
%trig_ts_C1=fs_c1(m).name;% trig time string
trig_ts_C2=fs_c2(m).name;% trig time string
trig_ts_D1=fs_d1(m).name;% trig time string
trig_ts_P=fs_p(m).name;% trig time string
trig_ts_U=fs_u(m).name;% trig time string
trig_ts_V=fs_v(m).name;% trig time string
trig_ts_W=fs_w(m).name;% trig time string

% fp=[fp_A1,logname_A1{3},'.log'];
% a= importdata(fp);


%%%----------trending A1, sample time=0.0004s------------

fp_A1=[fpn,'\TranRec_A1\',trig_ts_A1,'\'];%filepath
logname_A1=cell(1,10);
logname_A1{1}='2-FPGA_UD1';
logname_A1{2}='7-VLU1_mVLU';
logname_A1{3}='11-FPGA_UL_DC';
logname_A1{4}='12-FPGA_MC1_IR';
logname_A1{5}='14-FPGA_MC1_IS';
logname_A1{6}='16-FPGA_MC1_IT';
logname_A1{7}='18-VLU1_UD_w_out';
logname_A1{8}='19-VLU_PD';
logname_A1{9}='20-FPGA_IDC_pos';
logname_A1{10}='21-FPGA_IDC_neg';

[t_Ud,Ud,ts_Ud,tt_Ud,tts_Ud] = log_data_export([fp_A1,logname_A1{1},'.log'],trig_ts_A1); %Import  log file
[t_mVLU,mVLU,ts_mVLU,tt_mVLU,tts_mVLU] = log_data_export([fp_A1,logname_A1{2},'.log'],trig_ts_A1); %Import  log file
[t_UL,UL,ts_UL,tt_UL,tts_UL] = log_data_export([fp_A1,logname_A1{3},'.log'],trig_ts_A1); %Import  log file
[t_MC_IR,MC_IR,ts_MC_IR,tt_MC_IR,tts_MC_IR] = log_data_export([fp_A1,logname_A1{4},'.log'],trig_ts_A1); %Import  log file
[t_MC_IS,MC_IS,ts_MC_IS,tt_MC_IS,tts_MC_IS] = log_data_export([fp_A1,logname_A1{5},'.log'],trig_ts_A1); %Import  log file
[t_MC_IT,MC_IT,ts_MC_IT,tt_MC_IT,tts_MC_IT] = log_data_export([fp_A1,logname_A1{6},'.log'],trig_ts_A1); %Import  log file
[t_Ud_w,Ud_w,ts_Ud_w,tt_Ud_w,tts_Ud_w] = log_data_export([fp_A1,logname_A1{7},'.log'],trig_ts_A1); %Import  log file
[t_VLU_P,VLU_P,ts_VLU_P,tt_VLU_P,tts_VLU_P] = log_data_export([fp_A1,logname_A1{8},'.log'],trig_ts_A1); %Import  log file
[t_Id_p,Id_p,ts_Id_p,tt_Id_p,tts_Id_p] = log_data_export([fp_A1,logname_A1{9},'.log'],trig_ts_A1); %Import  log file
[t_Id_n,Id_n,ts_Id_n,tt_Id_n,tts_Id_n] = log_data_export([fp_A1,logname_A1{10},'.log'],trig_ts_A1); %Import  log file

%%%----------trending A2, sample time=0.0004s------------


fp_A2=[fpn,'\TranRec_A2\',trig_ts_A2,'\'];%filepath
logname_A2=cell(1,10);
logname_A2{1}='5-MC1_mMC';
logname_A2{2}='9-MC1_FC';

[t_mMC,mMC,ts_mMC,tt_mMC,tts_mMC] = log_data_export([fp_A2,logname_A2{1},'.log'],trig_ts_A2); %Import  log file
[t_MC_fc,MC_fc,ts_MC_fc,tt_MC_fc,tts_MC_fc] = log_data_export([fp_A2,logname_A2{2},'.log'],trig_ts_A2); %Import  log file




%%%----------trending B1, sample time=0.002s------------


fp_B1=[fpn,'\TranRec_B1\',trig_ts_B1,'\'];%filepath
logname_B1=cell(1,10);
logname_B1{1}='3-VLU1_RV';

[t_VLU_R,VLU_R,ts_VLU_R,tt_VLU_R,tts_VLU_R] = log_data_export([fp_B1,logname_B1{1},'.log'],trig_ts_B1); %Import  log file
%}

%%%----------trending B2, sample time=0.002s------------


fp_B2=[fpn,'\TranRec_B2\',trig_ts_B2,'\'];%filepath
logname_B2=cell(1,10);
logname_B2{1}='16-MC1_MCMode';

[t_MC_mcMode,MC_mcMode,ts_MC_mcMode,tt_MC_mcMode,tts_MC_mcMode] = log_data_export([fp_B2,logname_B2{1},'.log'],trig_ts_B2); %Import  log file

%%%----------trending B3, sample time=0.002s------------


fp_B3=[fpn,'\TranRec_B3\',trig_ts_B3,'\'];%filepath
logname_B3=cell(1,10);

%%%----------trending C1, sample time=0.012s------------

%{
fp_C1=[fpn,'\TranRec_C1\',trig_ts_C1,'\'];%filepath
logname_C1=cell(1,10);
%}
%%%----------trending C2, sample time=0.012s------------


fp_C2=[fpn,'\TranRec_C2\',trig_ts_C2,'\'];%filepath
logname_C2=cell(1,10);

logname_C2{1}='2-APP_PL_drv_max';
logname_C2{2}='3-APP_PL_brk_min';
logname_C2{3}='5-APP_EMC_w';
logname_C2{4}='18-APP_Vve';
logname_C2{5}='25-SM_SYS1_State';
logname_C2{6}='27-SM_DClink1_State';
logname_C2{7}='31-SM_MC1_State';
logname_C2{8}='34-SM_VLU1_State';

[t_app_Pdrvmax,app_Pdrvmax,ts_app_Pdrvmax,tt_app_Pdrvmax,tts_app_Pdrvmax] = log_data_export([fp_C2,logname_C2{1},'.log'],trig_ts_C2); %Import  log file
[t_app_Pbrkmin,app_Pbrkmin,ts_app_Pbrkmin,tt_app_Pbrkmin,tts_app_Pbrkmin] = log_data_export([fp_C2,logname_C2{2},'.log'],trig_ts_C2); %Import  log file
[t_app_emc_w,app_emc_w,ts_app_emc_w,tt_app_emc_w,tts_app_emc_w] = log_data_export([fp_C2,logname_C2{3},'.log'],trig_ts_C2); %Import  log file
[t_app_vve,app_vve,ts_app_vve,tt_app_vve,tts_app_vve] = log_data_export([fp_C2,logname_C2{4},'.log'],trig_ts_C2); %Import  log file
[t_sm_sys1,sm_sys1,ts_sm_sys1,tt_sm_sys1,tts_sm_sys1] = log_data_export([fp_C2,logname_C2{5},'.log'],trig_ts_C2); %Import  log file
[t_sm_dclink1,sm_dclink1,ts_sm_dclink1,tt_sm_dclink1,tts_sm_dclink1] = log_data_export([fp_C2,logname_C2{6},'.log'],trig_ts_C2); %Import  log file
[t_sm_mc1,sm_mc1,ts_sm_mc1,tt_sm_mc1,tts_sm_mc1] = log_data_export([fp_C2,logname_C2{7},'.log'],trig_ts_C2); %Import  log file
[t_sm_vlu1,sm_vlu1,ts_sm_vlu1,tt_sm_vlu1,tts_sm_vlu1] = log_data_export([fp_C2,logname_C2{8},'.log'],trig_ts_C2); %Import  log file

%%%----------trending W, sample time=0.012s------------


fp_W=[fpn,'\TranRec_W\',trig_ts_W,'\'];%filepath
logname_W=cell(1,5);

logname_W{1}='0-Bitset1_W';
logname_W{2}='1-Bitset2_W';
logname_W{3}='2-Bitset3_W';
logname_W{4}='3-Bitset4_W';
logname_W{5}='4-Bitset5_W';

[t_Bit3W,Bit3W,ts_Bit3W,tt_Bit3W,tts_Bit3W] = log_data_export([fp_W,logname_W{3},'.log'],trig_ts_W); %Import  log file
[t_Bit4W,Bit4W,ts_Bit4W,tt_Bit4W,tts_Bit4W] = log_data_export([fp_W,logname_W{4},'.log'],trig_ts_W); %Import  log file

Bit3W= dec2binmatrix(Bit3W,22);
data=timeseries(Bit3W,t_Bit3W);
label_cell=cell(1,size(Bit3W,2));
label_cell{1,1}='APP bChg DClink';
label_cell{1,2}='APP bEna VLU LT';
label_cell{1,3}='APP bEna LC1';
label_cell{1,4}='APP bEna LC2';
label_cell{1,5}='APP bEna GC';
label_cell{1,6}='APP bEna MC1';
label_cell{1,7}='APP bEna MC2';
label_cell{1,8}='APP bEna MC3';
label_cell{1,9}='APP bEna AUX';
label_cell{1,10}='APP bReset';
label_cell{1,11}='APP bStartEngine';
label_cell{1,12}='APP bisSanding';
label_cell{1,13}='APP bEna IceBreaker';
label_cell{1,14}='APP bTST VLU';
label_cell{1,15}='APP bAUX is 180kVA';
label_cell{1,16}='APP bComp start';
label_cell{1,17}='APP bDBfan isOn';
label_cell{1,18}='APP bBlk DB';
label_cell{1,19}='APP bRadar OK';
label_cell{1,20}='APP bMan TriggerTR';
label_cell{1,21}='APP bxPEC isOK';
label_cell{1,22}='APP OPC bEna CombineTest';

gca_3w=booleanPlot(data,t_Bit3W,'W-Bitset3',label_cell);
axes_3w=get(gca_3w,'CurrentAxes');
%axes_4w.YLim
figure(gca_3w)
hold on
plot([tt_Bit3W,tt_Bit3W],axes_3w.YLim,'m--')
ts=datestr(tts_Bit3W,'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,axes_3w.YLim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_Bit3W(1),axes_3w.YLim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
xlabel('time (s)');
axes_3w.XGrid='On';

Bit4W=dec2binmatrix(Bit4W,21);
data=timeseries(Bit4W,t_Bit4W);
label_cell=cell(1,size(Bit4W,2));
label_cell{1,1}='FPGA bTractionEna CM1';
label_cell{1,2}='FPGA bTractionEna CM2';
label_cell{1,3}='FPGA bTractionEna CM3';
label_cell{1,4}='FPGA bDI01- bCtL\_isClosed';
label_cell{1,5}='FPGA bDI02- bCtCh\_isClosed';
label_cell{1,6}='FPGA bDI03- L\_HSCBCA';
label_cell{1,7}='FPGA bDI04- L\_BRT';
label_cell{1,8}='FPGA bDI05- L\_FOR';
label_cell{1,9}='FPGA bDI06- L\_REV';
label_cell{1,10}='FPGA bDI07- L\_MOTOR';
label_cell{1,11}='FPGA bDI08- L\_HSCBOA';
label_cell{1,12}='FPGA bDI09- L\_HWD';
label_cell{1,13}='FPGA bDI10- ';
label_cell{1,14}='FPGA bDI11- L\_BRAKE';
label_cell{1,15}='FPGA bDI12- bBRFan\_MCB\_isClosed';
label_cell{1,16}='FPGA bDI13- bGUSP\_isOK';
label_cell{1,17}='FPGA bDI14- L\_FAST\_BE';
label_cell{1,18}='FPGA bDI15- L\_HSCBC';
label_cell{1,19}='FPGA bDI16- L\_PE';
label_cell{1,20}='FPGA bDI17- bMainFan\_isOK';
label_cell{1,21}='FPGA bDI18- bCtFan\_BR\_isCLosed';

gca_4w=booleanPlot(data,t_Bit4W,'W-Bitset4',label_cell);
axes_4w=get(gca_4w,'CurrentAxes');
%axes_4w.YLim
figure(gca_4w)
hold on
plot([tt_Bit4W,tt_Bit4W],axes_4w.YLim,'m--')
ts=datestr(tts_Bit4W(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,axes_4w.YLim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_Bit4W(1),axes_4w.YLim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
xlabel('time (s)');
axes_4w.XGrid='On';
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Figure %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure('name','Voltage and current','NumberTitle','off')
%%%UL Ud 
subplot(2,1,1)
plot(t_UL,UL,t_Ud,Ud,t_Ud_w,Ud_w)
ylim=get(gca,'Ylim');% get the y axis range
hold on
plot([tt_UL,tt_UL],ylim,'m--'); % triger time axis

xlabel('time (s)')
ylabel('Voltage (V)');
%datetick('x','mm-dd HH:MM:SS:FFF')
ts=datestr(tts_UL(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_UL(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('Voltage (UL, Ud, Ud\_w)');
legend('UL','Ud','Ud\_w')
grid on

subplot(2,1,2)
%%%IL Id
plot(t_Id_p,Id_p,t_Id_n,Id_n)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_Id_p,tt_Id_p],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('Current (A)');
ts=datestr(tts_Id_p(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_Id_p(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('Current(Id\_pos ,Id\_neg)');
legend('Id\_pos','Id\_neg')
grid on
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('name','MC control parameters','NumberTitle','off')
subplot(2,2,1)
%%%mMC
plot(t_mMC,mMC,'b')
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_mMC,tt_mMC],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('modulation of MC');
ts=datestr(tts_mMC(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_mMC(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('mMC');
legend('mMC')
grid on

subplot(2,2,2)
%%%mMC
plot(t_MC_mcMode,MC_mcMode,'b')
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_MC_mcMode,tt_MC_mcMode],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('MC mode');
ts=datestr(tts_MC_mcMode(1),'mm-dd HH:MM:SS:FFF');
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_MC_mcMode(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
title('MC mode');
legend('MC mode')
grid on


subplot(2,2,3)
%%%MC_FC
plot(t_MC_fc,MC_fc,'r')
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_MC_fc,tt_MC_fc],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('Carrier frequency (Hz)');
ts=datestr(tts_MC_fc(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_MC_fc(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('MC\_FC');
legend('MC\_FC')
grid on

subplot(2,2,4)
%%%MC_current
plot(t_MC_IR,MC_IR,t_MC_IS,MC_IS,t_MC_IT,MC_IT)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_MC_IR,tt_MC_IR],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('Current (A)');
ts=datestr(tts_MC_IR(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_MC_IR(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('MC output current ');
legend('MC\_IR','MC\_IS','MC\_IT')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','VLU control parameters','NumberTitle','off')

subplot(3,1,1)
plot(t_mVLU,mVLU)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_mVLU,tt_mVLU],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('modulation');
ts=datestr(tts_mVLU(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
% text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_mVLU(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('mVLU');
legend('mVLU')
grid on

subplot(3,1,2)
plot(t_VLU_P,VLU_P)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_VLU_P,tt_VLU_P],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('power (W)');
ts=datestr(tts_VLU_P(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_VLU_P(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('VLU power');
legend('VLU\_Power')
grid on

subplot(3,1,3)
plot(t_VLU_R,VLU_R)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_VLU_R,tt_VLU_R],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('Resistance (Ohm)');
ts=datestr(tts_VLU_R(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_VLU_R(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('VLU BR');
legend('VLU\_R')
grid on
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','SM state machine','NumberTitle','off')

subplot(2,2,1)
plot(t_sm_sys1,sm_sys1)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_sm_sys1,tt_sm_sys1],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('State machine');
%xlim([0,5]);
ts=datestr(tts_sm_sys1(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_sm_sys1(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('SM\_SYS1');
legend('SM\_SYS1')
grid on

subplot(2,2,2)
plot(t_sm_dclink1,sm_dclink1)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_sm_dclink1,tt_sm_dclink1],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('State machine');
%xlim([0,5]);
ts=datestr(tts_sm_dclink1(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_sm_dclink1(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('SM\_DC\_link');
legend('SM\_DC\_link')
grid on

subplot(2,2,3)
plot(t_sm_mc1,sm_mc1)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_sm_mc1,tt_sm_mc1],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('State machine');
%xlim([0,5]);
ts=datestr(tts_sm_mc1(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_sm_mc1(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('SM\_MC1');
legend('SM\_MC1')
grid on

subplot(2,2,4)
plot(t_sm_vlu1,sm_vlu1)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_sm_vlu1,tt_sm_vlu1],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('State machine');
%xlim([0,5]);
ts=datestr(tts_sm_vlu1(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_sm_vlu1(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('SM\_VLU1');
legend('SM\_VLU1')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('name','Vehicle status','NumberTitle','off')

subplot(2,2,1)
plot(t_app_vve,3.6*app_vve)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_app_vve,tt_app_vve],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('speed (km/h)');
%xlim([0,5]);
ts=datestr(tts_app_vve(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_app_vve(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('vehicle speed');
legend('speed')
grid on

subplot(2,2,2)
plot(t_app_emc_w,app_emc_w)
ylim=get(gca,'Ylim'); % get the y axis range
hold on
plot([tt_app_emc_w,tt_app_emc_w],ylim,'m--'); % triger time axis
xlabel('time (s)')
ylabel('effort (N)');
%xlim([0,5]);
ts=datestr(tts_app_emc_w(1),'mm-dd HH:MM:SS:FFF');
% ax = gca;
% ax.XAxis.TickLabels{1}=[ts,'(0)'];
%text(0,ylim(2),['start time:',ts],'Color','red','VerticalAlignment','bottom');
text(t_app_emc_w(1),ylim(2),['trigger time:',ts],'Color','red','VerticalAlignment','bottom','HorizontalAlignment','center');
title('Effort wated');
legend('app\_effort\_w')
grid on
%}

%%%%%%%%%%%%%%%plot the calculated BR resistance
%{
t=0:2*1e-3:0.2;
n=length(t);
vlu_p=interp1(t_VLU_P,VLU_P,t);
vlu_m=interp1(t_mVLU,mVLU,t);
ud=interp1(t_Ud,Ud,t);
br_bw=interp1(t_VLU_R,VLU_R,t);
br_cal=zeros(1,n);
for i=1:n
    if vlu_m(i)>0.08 && vlu_p(i)>1000
        br_cal(i)=2*vlu_m(i)*ud(i)^2/vlu_p(i);
    elseif i>1
        br_cal(i)= br_cal(i-1);
    else
        br_cal(i)=1.33;
    end
end

figure()
subplot(3,2,1)
plot(t,vlu_p,'-o')

subplot(3,2,2)
plot(t,vlu_m,'-o')

subplot(3,2,3)
plot(t,ud,'-o')

subplot(3,2,5)
plot(t,br_bw,'--or')

subplot(3,2,6)
plot(t,br_cal,'-ob')

%plot(t,br_bw,'--r',t,br_cal,'-ob')
%}