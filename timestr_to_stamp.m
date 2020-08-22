function [t]=timestr_to_stamp(timestr)
a=strsplit(timestr);
b=strsplit(a{1},'.');
c=strsplit(a{2},'_');
y=str2num(b{3});
m=str2num(b{2});
d=str2num(b{1});
h=str2num(c{1});
min=str2num(c{2});
s=str2num(c{3});

sd=datenum(y-1900,m,d);% sum of days
%n=datenum(y,m,d,h,min,s)
%t=datenum(y,m,d,h,min,s);
t=((sd-18-70*365)*86400+h*3600+min*60+s)-8*3600;

