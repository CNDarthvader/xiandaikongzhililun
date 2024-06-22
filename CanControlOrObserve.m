function CanControlOrObserve(A,B,C,D)
sys = ss(A, B, C, D);
n = size(A,1);
% 计算可控性矩阵
Ctrb = ctrb(sys);
rank1 = rank(Ctrb);
disp('可控性矩阵为')
disp(Ctrb)
fprintf('可控性矩阵的秩为%d\n',rank1)
if rank(Ctrb) == size(sys.A,1)
    disp('系统可控')
else
    disp('系统不可控')
end
% 计算可观性矩阵
Obsv = obsv(sys);
rank2 = rank(Obsv);
disp('可观性矩阵为')
disp(Obsv)
fprintf('可观性矩阵的秩为%d\n',rank2)
if rank(Obsv) == size(sys.A,1)
    disp('系统能观')
else
    disp('系统不能观')
end
end