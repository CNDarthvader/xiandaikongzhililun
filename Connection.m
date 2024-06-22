function Connection(k,L,A,B,C,D)
A_cl = [A-B*k      B*k;
        zeros(size(A)) A-L*C];
B_cl = [B; zeros(size(B))];
C_cl = [C zeros(size(C))];
D_cl = D;
% 模拟闭环系统
sys_cl = ss(A_cl, B_cl, C_cl, D_cl);
% 模拟响应
t = 0:0.01:5;
r = ones(size(t)); % 单位阶跃输入
[y, t, x] = lsim(sys_cl, r, t);
% 绘制输出响应
plot(t, y);
xlabel('Time (s)');
ylabel('Output');
title('含有状态观测器的闭环系统响应');
end