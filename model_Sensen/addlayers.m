function B = addlayers(A)

[x,y] = find(A(:,:,1) == 1);
[x,y] = Permutation(x,y);
[a,b] = size(A(:,:,1));
B = zeros(a,b,length(x));
for h = 1:length(x)
    B(x(h),y(h),h) = A(x(h),y(h),1);
end

end