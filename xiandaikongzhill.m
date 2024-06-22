%飞机控制系统建模
clear
% 定义系统参数
A = [-0.322 0.052 0.028 -1.12 0.002;
     0 0 1 -0.001 0;
     -10.6 0 -2.87 0.46 -0.65;
     6.87 0 -0.04 -0.32 -0.02;
     0 0 0 0 -7.5];

B = [0 0 0 0 7.5]';

C = [0 0 0 0 1;
     0 1 0 0 0;
     1 0 0 0 0;
     0 0 1 0 0;
     0 0 0 1 0];

D = zeros(5,1);

% 创建状态空间模型
sys = ss(A, B, C, D);


%检查ABCD是否为常数矩阵 
isLinear = isnumeric(A) && isnumeric(B) && isnumeric(C) && isnumeric(D);
% 检查A，B，C，D矩阵是否不随时间变化
isTimeInvariant = isLinear;  % 如果系统是线性的，那么它就是时间不变的
% 如果系统是线性的并且是时间不变的，那么它就是线性定常的
if isLinear && isTimeInvariant
    disp('这是一个线性定常系统')
else
    disp('这不是一个线性定常系统')
end


%解
disp('要想求出状态转移矩阵和系统的解，输入TransitionAndSolution(A,B,C)')


% 检查系统的可控性
disp('要想判断可控性和可观性，输入CanControlOrObserve(A,B,C,D)')


% %标准型
disp('要想得到能控标准2型，输入toControllableForm(A, B, C, D)')


%判断稳定性
disp('要想使用Lyapunov第一法，输入Lyapunov1(A)')
disp('要想使用Lyapunov第二法，输入Lyapunov2(A)')


%极点配置问题
fprintf('要想进行极点配置，输入stateFeedbackPolePlacement(A, B)\n')


%镇定问题
disp('要想检测系统是否镇定，输入checkStabilizability(A)')

%解耦问题
disp('要想将系统解耦，输入decoupleSystem(A, B, C, D)')

%状态观测器
disp('要想配置状态观测器，输入calculateObserverGain(A,B,C)')

%系统响应
disp('要想得到闭环系统的阶跃响应，输入CloseloopReaction(A,B,C,D)')

%链接状态观测器
disp('要想得到闭环系统的阶跃响应，输入Connection(k,L,A,B,C,D)')

