function hPlot = booleanPlot(data, time, titlestr,labelset)
% *************************************************************************
% Program:      Boolean Ploter
%
% File:         <a href="matlab:open('boolPlot.m')">boolPlot.m</a>
%
% Functions:    hPlot = boolPlot(data, time)
%
% Description:  Makes a stacked plot for boolean values.
%
% Arguments:    data:
%                   timeseries object or a nueric array, can a be matrix.
%               time:
%                   time vector, only used if the "data" arg is numeric. In
%                   this case time may still be ommited.
%
% Returns:      hPlot:
%                   handle to the produced figure
%
% Useage:       boolPlot(randi([0,1],50,5))
%
% Revisions:    1.00 04/05/20 (tf) First release
%               Ray lee modified on 2020.5.6, add the title string into the
%               argument
%
% See also:     randomPlot
% *************************************************************************

%% boolPlot

openNewFigure = true;
figTag = titlestr;
figName = titlestr;
tsData = isa(data,'timeseries');
numData = isnumeric(data);
boolHeight = 1;
boolSpace = 0.5;
trueLable = '';
falseLabel = '';

assert(tsData || numData,'data must be numeric or a timeseries')

if openNewFigure
    hPlot = figure('Name',figName, 'tag',figTag,'NumberTitle','off');
    hAxe = axes(hPlot);
else
    hPlot = findobj(0,'tag',figTag);
    if isempty(hPlot)
        hPlot = figure('Name',figName', 'tag',figTag,'NumberTitle','off');
        hAxe = axes(hPlot);
    else
        clf(hPlot);
        hAxe = axes(hPlot);
        figure(hPlot);
    end
end

cM = get(0,'DefaultAxesColorOrder');
cN = size(cM,1);

if numData
    if isrow(data)
        data = transpose(data);
    end
    if nargin < 2
        tsData = timeseries(data,0:length(data)-1);
    else
        time = reshape(time,1,numel(time));
        if (find(size(data) == numel(time),1) ~= 1)
            data = transpose(data);
        end
        tsData = timeseries(data,time);
    end
elseif tsData
    tsData = data;
end

[tsPlot, nPlot] = compressTimeseries(tsData);
yOffset = 0;
yTickLabel = cell(1,nPlot*3);
minT = inf;
maxT = 0;

for n = 1 : nPlot
    idx = (n-1)*3+1;
    yTickLabel(idx:idx+2) = {falseLabel,['Bit' num2str(n-1) ' : ' labelset{n}],trueLable};
    b = tsPlot(n).Data;
    t = tsPlot(n).Time;
    minT = min(minT,min(t));
    maxT = max(maxT,max(t));
    rbg = cM(mod(n-1,cN)+1,:);
    Y = [];
    if isvector(t) && ismatrix(b) && size(b,1)==length(t)
        t = reshape(t,length(t),1);   
    else
        error('x and y dimentions should be consistent.')
    end
    for k = 1 : size(b,2)
        t = [t'; t'];
        rect = [b(:,k)'; b(:,k)'];
        rect = rect(:);
        Y(:,k) = rect; %#ok<AGROW>
        xPlot = [t([2:end end]), fliplr(t([2:end end]))];
        yPlot = boolHeight * [Y; zeros(length(xPlot)/2,size(Y,2))];
        patch(hAxe,'XData',xPlot,'YData',yPlot+yOffset,'FaceColor',rbg);
        yOffset = yOffset + boolHeight + boolSpace;
    end
end

yTickPos = [0,cumsum(repmat([boolHeight/2, boolHeight/2,boolSpace],1,nPlot))];

set(hAxe,'YTick',yTickPos(1:end-1))
set(hAxe,'YTickLabel',yTickLabel,'fontsize',7);
set(hAxe,'TickLength',[0 0]);
set(hAxe,'XLim',[minT maxT]);
set(hAxe,'YLim',[0 yOffset]);
if ~isempty(titlestr)
    title(titlestr);
end
end

function [tsOutArray, nElem] = compressTimeseries(tsIn)
    nTime = numel(tsIn.Time);
    nElem = numel(tsIn.Data)/nTime;
    allData = boolean(tsIn.Data);
    indexAllData = @(n) (n-1)*nTime+1:(n-1)*nTime+nTime;
    tsOutArray(nElem) = timeseries;
    for n = 1 : nElem
        elemData = allData(indexAllData(n));
        deltas = reshape(diff(elemData(1:end-1))~=0,nTime-2,1);
        deltaIdx = [true; deltas; true];
        deltaData = reshape(elemData(deltaIdx),sum(deltaIdx),1);
        deltaTime = tsIn.Time(deltaIdx);
        tsOutArray(n) = timeseries(deltaData,deltaTime);
    end
end