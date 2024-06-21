function TransitionAndSolution(A,B,C)
%求解状态变量
%计算特征值和特征向量
[W,lamda]=eig(A); L=inv(W)*A*W; b=inv(W)*B; c=C*W;
disp('对角线规范型为:');
L
b
c
disp('状态转移矩阵为:');
W
%仿真数据初始化
WhetherX0Zero = input('你需要给定x0然后解出状态方程吗?(若不指定，则默认为0)[y/n]','s');
switch WhetherX0Zero
    case 'n'
        x0 = [0;0;0;0;0];
    case 'y'
        systemOrder = size(A, 1);
        fprintf('系统的阶数为 %d，因此您需要输入初始状态的维数为 %d 。', systemOrder, systemOrder);
        ran2 = randi([1,10],systemOrder,1);
        fprintf('例如%s \n',mat2str(ran2))
        x0 = input('输入初始状态：');
        xx0 = inv(W)*x0;
end
t=0:0.01:3; 
n=length(t);
x=zeros(5,n); 
xx=zeros(5,n);
%求解状态变量和输出
for i=1:n
xx(:,i)=expm(L*t(i))*xx0;
x(:,i)=W*xx(:,i);
end
plot(t,x)
title('System Time Response with u=0');
xlabel('Time-sec'); ylabel('Response-value');


WhetherInputZero = input('是否指定输入u?(若不指定，则默认为0)[y/n]','s');
switch WhetherInputZero
    case 'n'
        u = [0;0];
        tau = 0;
    case 'y'
        syms tau
        Whichu = input('选择您想要的系统输入：[阶跃/斜坡/加速度/脉冲]','s');
        switch Whichu
            case '阶跃'
                u = 1;
            case '斜坡'
                u = tau;
            case '加速度'
                u = tau^2/2;
            case '脉冲'
                u = dirac(tau);
        end
end





% 计算齐次解
x_h = eAt * x0;
% 计算特解
integrand = expm(A * (t - tau)) * B * u;
if tau == 0
    x_p = 0;
else
    x_p = int(integrand, tau, 0, t);
end
xt = x_h + x_p;
fprintf('状态方程解的表达式为\n')
disp(xt)
yt = C*xt;
fprintf('输出为\n')
disp(yt)
end

