function TansitionAndSolution(A,B)
%状态转移矩阵
syms t        
eAt = exp(A*t);% 计算状态转移矩阵
fprintf('状态转移矩阵为')
disp(eAt)
% 计算状态方程的解
syms x0
u = 0;      %输入
xt = eAt * x0 + int(eAt * B * u, 0, t);
fprintf('状态方程解的表达式为')
disp(xt)
go = input('你需要给定x0然后解出状态方程吗?[y/n]\n','s');
if go == 'y'
    systemOrder = size(A, 1);
    fprintf('系统的阶数为 %d，因此您需要输入初始状态的维数为 %d 。\n', systemOrder, systemOrder);
    X0 = input('请输入初始状态，格式如[-1; -2]: ');
    X = eAt * X0 + int(eAt * B * u, 0, t);
    disp('解为')
    disp(X)
elseif go == 'n'
end
end