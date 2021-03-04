function P = ShortestPathLink(P)

P(:,:,end+1) = 0.*P(:,:,end);
P(:,:,end+1) = P(:,:,end);
[m,n] = size(P(:,:,1));
for j = 1:m
    for k = 1:n
        [Val,Cor] = max(P(j,k,1:end-2));
        P(j,k,end-1) = Cor;  %store the layer of the maxium layer
        P(j,k,end) = Val;    %store the maxium value
    end
end













end