function [filestruct]=foldercheck(folerpathstr)
a = dir(folerpathstr);
filestruct=a(~ismember({a(:).name},{'.','..'}));