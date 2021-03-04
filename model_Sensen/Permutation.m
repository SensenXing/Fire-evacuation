function [xN,yN] = Permutation(xO,yO)
%Permutate randomly one vector and adjust the second
%xO,yO have to be the same length

%%
%Code
l = length(xO);
    vR = randperm(l);

for i = 1:l
    xN(i) = xO(vR(i));
    yN(i) = yO(vR(i));
end
end