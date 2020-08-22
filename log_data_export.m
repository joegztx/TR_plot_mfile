function [x,y,t_s,t_t,t_ts]=log_data_export(filename,timestring)
% Arguments 
%   :file name: 
%   :timestring: the string of trigger time 
A = importdata(filename); %Import from the log file
%LogInfo=A.textdata;
t_trig=timestr_to_stamp(timestring);
t_ts=(t_trig+8*3600)/(24*3600)+70*365+18;% time unit: days

timestamp=(A(:,2)-621355968000000000)/10000000;% time unit: seconds
t_s=(timestamp+8*3600)/(24*3600)+70*365+18;% time unit: days

%t_t=t_trig-timestamp(1);
%x=timestamp-timestamp(1);
t_t=0;
x=timestamp-t_trig;
y=A(:,1);