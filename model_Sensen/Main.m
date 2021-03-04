%Code for Evacuation 
%Sensen Xing Febuary 2021
%%
clear all
close all
clc
%% Loadroom
filename = '\room_2.csv';
folder = [pwd,filename];
[R,P] = LoadRoom(folder); %R is the matrix for the map, each layer of P is the corresponding path of each exit
PlotRoom(R);
hold on
%% Main
A = PlaceAgent(R); %place agents
P = ShortestPathLink(P); %find the shortest path for each agent
spy(A(:,:,1),'r')
legend('Walls', 'Paths','Seats','Tables','Exits','Agents');
%% Function test
step = 100;
P_max = P(:,:,end); %Path matrix
B = addlayers(A); %save agents in differnet layers
C = sum(B,3); % sum all values in the end of the layer
[a1,b1,c1]= size(B);
D = zeros(a1,b1,c1); %initialize a martix
F = zeros(a1,b1,c1); %initialize a martix for fast speed case
E = zeros(a1,b1); %save density
step_move = 1;
AgWin = VelocityDis(c1); %velocity distribution
while step > 0
for h = 1:length(B(1,1,:))
    [x,y] = find(B(:,:,h) == 1);
    if x ~= 0
        c = [x,y]; 
        %low velocity
        if h <= AgWin(1) %move 0.5 box of each step
            if mod(step_move,2) == 0 %determine the even
                D(:,:,h) = AgentsMove(D(:,:,h),R,P_max,c,E); %save new positions in matrix D
            else
                D(:,:,h) = B(:,:,h); %angents do not move
            end
        end
        %normal velocity
        if h > AgWin(1) && h < AgWin(2)+AgWin(1) %move 1 box of each step
            D(:,:,h) = AgentsMove(D(:,:,h),R,P_max,c,E); %save new positions in matrix D 
        end
        %fast velocity
        if h >= AgWin(1) + AgWin(2)%move 2 box of each step
            D(:,:,h) = AgentsMove(D(:,:,h),R,P_max,c,E);
            
            [x3,y3] = find(D(:,:,h) == 1);
            c = [x3,y3];
            F(:,:,h) = AgentsMove(F(:,:,h),R,P_max,c,E);
            D(:,:,h) = F(:,:,h);
            F = zeros(a1,b1,c1);
        end        
                
    else
        continue
    end
end
step_move = step_move + 1;
E = sum(D,3); % sum all values in the end of the layer
B = D; %save the last step
D = zeros(a1,b1,c1); %initialize martix D
figure(2)
hold on
PlotRoom(R);
legend off
spy(E,'r')

figure(3)
h=bar3(E);
zlim([0 4])
set(gcf,'position',[800 50 500 500]);
pause(0.2);
step = step -1;
   if E == 0 %if angents all outside, stop the loop
      break
   end
end







