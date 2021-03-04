function AgWin = VelocityDis(N)

% N Amount of peolple
Win = gausswin(3,2); %velocity distribution
WinNorm = Win./sum(Win);
AgWin = fix(N.*WinNorm);
AgWin(fix(length(AgWin)/2)+1) = AgWin(fix(length(AgWin)/2)+1)+N-sum(AgWin);
end