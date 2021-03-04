function A = PlaceAgent(R)

[x,y] = size(R);
A = zeros(x,y);
[x1,y1] = find(R == 0); %find the seat palce

for i = 1:length(x1)
    A(x1(i),y1(i)) = 1; %add the seat position on matrix A represt Agents
end
   
end