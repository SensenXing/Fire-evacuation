function PlotRoom(R)
%plots a room Matrix R a bit fancy (hopefully)
% define identifiers for the several objects
markersize = 20;
if nargin == 1
if find(R==0)
 %R = rot90(R,1); %Rotate the matrix 1*90 degree
len = length(R);
%wall
wallmarker = 's';
wallmarkersize = markersize;
walllinestyle = 'none';
wallcolor = [0 0 0];
[j, k] = find(isnan(R));
plot(k,j,'marker',wallmarker,'markersize',wallmarkersize, 'linestyle', walllinestyle,'color',wallcolor, 'MarkerFaceColor',wallcolor);
hold on;

%Path
Paths = 1;
pathmarker = 's';
pathmarkersize = markersize;
pathlinestyle = 'none';
pathcolor = [1 1 1];
[j, k] = find(R >= Paths);
plot(k,j,'marker',pathmarker,'markersize',pathmarkersize, 'linestyle', pathlinestyle,'color',pathcolor, 'MarkerFaceColor',pathcolor);
hold on;

%Seats
Seats = 0;
seatsmarker = 's';
seatsmarkersize = markersize;
seatslinestyle = 'none';
seatscolor = [72 125 253]./256;
[j, k] = find(R == Seats);
plot(k,j,'marker',seatsmarker,'markersize',seatsmarkersize, 'linestyle', seatslinestyle,'color',seatscolor,'MarkerFaceColor',seatscolor);

%Tables
Tables = -1;
tablesmarker = 's';
tablesmarkersize = markersize;
tableslinestyle = 'none';
tablescolor = [254 158 57]./256;
[j, k] = find(R == Tables);
plot(k,j,'marker',tablesmarker,'markersize',tablesmarkersize, 'linestyle',tableslinestyle,'color',tablescolor,'MarkerFaceColor',tablescolor);


%Exits
Exits = inf;
exitsmarker = 's';
exitsmarkersize = markersize;
exitslinestyle = 'none';
exitscolor = [254 249 44]./256;
[j, k] = find(R == Exits);
plot(k,j,'marker',exitsmarker,'markersize',exitsmarkersize, 'linestyle',exitslinestyle,'color',exitscolor,'MarkerFaceColor',exitscolor);

% %Fillups
% Fillups = -2;
% fillupsmarker = 's';
% fillupsmarkersize = markersize;
% fillupslinestyle = 'none';
% fillupscolor = [254 93 104]./256;
% [j, k] = find(R == Fillups);
% plot(k,j,'marker',fillupsmarker,'markersize',fillupsmarkersize, 'linestyle',fillupslinestyle,'color',fillupscolor,'MarkerFaceColor', fillupscolor);

legend('Walls', 'Paths','Seats','Tables','Exits');
% title(sprintf('plot of the room matrix. Exit value = %d', Exits));
xlim([0 len+2])
ylim([0 len+2])
set(gcf,'Color','white')
set (gca,'position',[0.1,0.1,0.8,0.8]);
set(gcf,'position',[50 50 700 700]);
else
    
wallmarker = 's';
wallmarkersize = markersize;
walllinestyle = 'none';
wallcolor = [0 0 0];
[j, k] = find(isnan(R));
plot(k,j,'marker',wallmarker,'markersize',wallmarkersize, 'linestyle', walllinestyle,'color',wallcolor, 'MarkerFaceColor',wallcolor);

hold on;

Paths = 1;
pathmarker = 's';
pathmarkersize = markersize;
pathlinestyle = 'none';
pathcolor = [1 1 1];
[j, k] = find(R >= Paths);
plot(k,j,'marker',pathmarker,'markersize',pathmarkersize, 'linestyle', pathlinestyle,'color',pathcolor, 'MarkerFaceColor',pathcolor);
hold on;

Seats = 0;
seatsmarker = 's';
seatsmarkersize = markersize;
seatslinestyle = 'none';
seatscolor = [72 125 253]./256;
[j, k] = find(R == Seats);
plot(k,j,'marker',seatsmarker,'markersize',seatsmarkersize, 'linestyle',seatslinestyle,'color',seatscolor,'MarkerFaceColor',seatscolor);

Tables = -1;
tablesmarker = 's';
tablesmarkersize = markersize;
tableslinestyle = 'none';
tablescolor = [254 158 57]./256;
[j, k] = find(R == Tables);
plot(k,j,'marker',tablesmarker,'markersize',tablesmarkersize,'linestyle',tableslinestyle,'color',tablescolor,'MarkerFaceColor',tablescolor);

% Fillups = -2;
% fillupsmarker = 's';
% fillupsmarkersize = markersize;
% fillupslinestyle = 'none';
% fillupscolor = [254 93 104]./256;
% [j, k] = find(R == Fillups);
% plot(j,k,'marker',fillupsmarker,'markersize',fillupsmarkersize,'linestyle',fillupslinestyle,'color',fillupscolor,'MarkerFaceColor',fillupscolor);
legend('Walls', 'Paths','Seats','Tables','Exits');
title(sprintf('plot of the room matrix. Exit value = %d', Exits));
xlim([0 len+2])
ylim([0 len+2])
set(gcf,'Color','white')
set (gca,'position',[0.1,0.1,0.8,0.8]);
set(gcf,'position',[50 50 700 700]);
end
else
end
end