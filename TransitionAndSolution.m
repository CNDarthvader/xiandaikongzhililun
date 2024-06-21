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
WhetherInputZero = input('是否指定输入u?(若不指定，则默认为0)[y/n]','s');
WhetherX0Zero = input('你需要给定x0然后解出状态方程吗?(若不指定，则默认为0)[y/n]','s');
switch WhetherX0Zero
    case 'n'
        x0 = [0;0;0;0;0];
        xx0 = [0;0;0;0;0];
    case 'y'
        systemOrder = size(A, 1);
        fprintf('系统的阶数为 %d，因此您需要输入初始状态的维数为 %d 。', systemOrder, systemOrder);
        ran2 = randi([1,10],systemOrder,1);
        fprintf('例如%s \n',mat2str(ran2))
        x0 = input('输入初始状态：');
        xx0 = inv(W)*x0;
end
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
t=0:0.01:3; 
n=length(t);
x=zeros(5,n); 
xx=zeros(5,n);
%求解状态变量和输出
for i=1:n
    xx(:,i)=expm(L*t(i))*xx0;
    x(:,i)=W*xx(:,i);
    y = C*x;
end
subplot(2,1,1)
plot(t,x)
title('零输入时的状态变量');
xlabel('Time-sec'); ylabel('Response-value');
subplot(2,1,2)
plot(t,y)
title('零输入时的系统输出')



