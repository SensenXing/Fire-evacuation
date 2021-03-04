function [P] = AddExit_v2(R,P,c,value,depth) %c represent the door position, value represent
%the maxium value -1
%Adds exit at 'c' with value 'value' and path values to room matrix R
if depth == 90 % to prevent the rescursion to get too far
   return
end
[m,n]=size(R);
x = c(1);
y = c(2);
newcoords = [];
coordcount = 0;
%"check" the direction:left, down, right, up
%plot(x,y,'marker','.');
%pause(0.001)

%check left
cx = x;
cy = y-1;
if cy>0 %keep in matrix range
    while R(cx,cy) == -2
        cy = cy-1;
    end
    if (value > P(cx,cy) && R(cx,cy) >= 0 ) %if its path
        newcoords = [newcoords; cx cy];
        coordcount = coordcount + 1;
        P(cx,cy) = value;
    end
end

%check down
cx = x-1;
cy = y;
if cx > 0 %still in matrix range
    while R(cx,cy) == -2
        cx = cx-1;
    end
    if (value > P(cx,cy) && R(cx,cy) >= 0 ) %if its path
        newcoords = [newcoords; cx cy];
        coordcount = coordcount + 1;
        P(cx,cy) = value;
    end
end

%check right
cx = x;
cy = y+1;
if cy <= n %still in matrix range
    while R(cx,cy) == -2
        cy = cy+1;
    end
    if (value > P(cx,cy) && R(cx,cy) >= 0 ) %if its path
        newcoords = [newcoords; cx cy];
        coordcount = coordcount + 1;
        P(cx,cy) = value;
    end
end

%check up
cx = x+1;
cy = y;
if cx <= m %still in matrix range
    while R(cx,cy) == -2
        cx = cx+1;
    end
    if (value > P(cx,cy) && R(cx,cy) >= 0 ) %if its path
        newcoords = [newcoords; cx cy];
        coordcount = coordcount + 1;
        P(cx,cy) = value;
    end
end   

depth = depth + 1;
for i = 1:coordcount
    P = max(AddExit_v2(R,P,newcoords(i,:),value-1,depth),P);
end
end