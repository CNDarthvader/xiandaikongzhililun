function calculateObserverGain(A, B, C)
    % 计算系统的阶数，即矩阵A的行数
    systemOrder = size(A, 1);
    fprintf('系统的阶数为 %d，因此您需要输入 %d 个极点。\n', systemOrder, systemOrder);
    desiredObserverPoles = input('请输入期望的状态观测器极点，格式如[-1, -2]: ');    
    % 计算观测器增益L
    L = place(A', C', desiredObserverPoles)';
    disp('状态观测器的增益为:')
    disp(L)
    %状态观测器的状态表达式
    syms x [size(A,1), 1] real; % 状态估计向量
    syms y [size(C,1), 1] real; % 输出向量
    syms u [size(B,2), 1] real; % 输入向量（假设输入向量u的大小与A的列数相同）
    observerEquationSym = A*x + B*u + L*(y - C*x);
    observerEquation = char(observerEquationSym);     % 将符号方程转换为字符串
    disp('状态观测器的状态方程:');
    disp(observerEquation)
end