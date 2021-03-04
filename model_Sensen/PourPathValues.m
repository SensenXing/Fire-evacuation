function P = PourPathValues(R)

%Fills a tensor P with path values from room matrix R
% P = PourPathValues(R)
% Detects exits by ’inf’ and tries to "pour" the values through the paths
%get max possible value for a path (just to have enough overhead for
%filling the paths) = n*m
[m,n] = size(R);
maxval = m*n;

% locate every exit
[x,y] = find(R==inf);
P = zeros(m,n,length(x)); %tensor = matrix for each exit

for i = 1:size(x,1)
    P(x(i),y(i),i) = maxval;
    P(1:end,1:end,i) = AddExit_v2(R,P(:,:,i),[x(i) y(i)], maxval-1,0); %control different door each time
end
end

