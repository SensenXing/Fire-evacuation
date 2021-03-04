function B = AgentsMove(B,R,P,c,E)

if isempty(c)
    return
end

x = c(1);
y = c(2);

if x <= 1 || x == length(R(:,1)) %if regents touch left and right edges, stop to check
    return
elseif y <= 1 || y == length(R(1,:)) %if regents touch up and down edges, stop to check
    return
end

%change the check order randomly


order = randperm(4); %random the order

for i = 1:4
    order2 = order(i);
    switch order2
        case 1
%check right

if (P(x+1,y)>P(x,y) && R(x,y) >= 0)
    if E(x+1,y) < 4 %if density less than 4, the agent can move
        B(x+1,y) = 1;
        return
    else
        return
    end
end
        case 2
%check left
if (P(x-1,y)>P(x,y) && R(x,y) >= 0)
    if E(x-1,y) < 4      
        B(x-1,y) = 1;
        return
    else
        return
    end
end
        case 3
%check down
if (P(x,y+1)>P(x,y) && R(x,y) >= 0)
    if E(x,y+1) < 4
        B(x,y+1) = 1;
        return
    else
        return
    end
end
        case 4
%check up
if (P(x,y-1)>P(x,y) && R(x,y) >= 0)
    if E(x,y-1) < 4
       B(x,y-1) = 1;
       return
    else
        return
    end
end
    end
end

end