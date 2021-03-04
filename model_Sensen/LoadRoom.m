function [R,P] = LoadRoom(folder)

R = readmatrix(folder);
R = R(2:end-1,2:end-1); %cut out the borders
P = PourPathValues(R);
end
