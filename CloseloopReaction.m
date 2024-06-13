function CloseloopReaction(A,B,C,D)
% 定义系统的状态空间模型
sys = ss(A, B, C, D);
% 定义LQR的权重矩阵
Q = eye(size(A));
R = eye(size(B, 2));
% 计算LQR控制器的增益
[K, ~, ~] = lqr(sys, Q, R);
% 定义观测器的增益矩阵
L = place(A', C', eig(A-B*K)');
% 定义观测器的状态空间模型
observer = ss(A-L*C, [B L], eye(size(A)), 0*[B L]);
% 定义状态反馈控制器
controller = ss(-K);
% 连接观测器和控制器
sys_cl = feedback(sys, controller);
% 定义输入信号
t = 0:0.01:10;  % 时间向量
u = sin(t);  % 输入信号
% 模拟系统的响应
[y, t] = lsim(sys_cl, u, t);
% 绘制系统的响应
figure;
plot(t, y);
xlabel('Time (s)');
ylabel('Output');
title('Response of the closed-loop system');
% 获取阶跃响应信息
info = stepinfo(sys_cl);
% 打印阶跃响应信息
disp('Step response information:');
disp(info)
end