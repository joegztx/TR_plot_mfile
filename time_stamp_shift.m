clc
clear

a='05.03.2020 18_39_16.3682554';
ay=timestr_to_stamp(a)

b=637190015550682554;
by=(b-621355968000000000)/10000000

e=ay-by
