clc
clear

d = dir('C:\Users\ray\Desktop\MC Overcurrent\2020-03-07_SJZL2_1st Train M1 AW3 MC Overcurrent Fault TR\TranRec_A1');
dfolders = d([d(:).isdir]==1);
dfolders2=d(~ismember({d(:).name},{'.','..'}));
tdp_a1=dfolders(1).folder;

