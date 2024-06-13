function [Ao, Bo, Co, Do] = toObservableForm(A, B, C, D)
    % 将状态空间模型转换为能观标准型
    % 输入:
    % A, B, C, D - 原始状态空间模型的矩阵
    % 输出:
    % Ao, Bo, Co, Do - 能观标准型的矩阵

    % 计算能观矩阵
    Ob = obsv(A, C);
    
    % 检查系统是否完全能观
    if rank(Ob) < size(A, 1)
        error('系统不是完全能观的');
    end
    
    % 计算转换矩阵
    T = Ob; % 在这个简化的例子中，我们直接使用能观矩阵作为转换矩阵
    
    % 计算能观标准型的矩阵
    Ao = inv(T) * A * T;
    Bo = inv(T) * B;
    Co = C * T;
    Do = D; % D矩阵通常保持不变
    
    % 显示结果
    disp('能观标准型的矩阵Ao:');
    disp(Ao);
    disp('能观标准型的矩阵Bo:');
    disp(Bo);
    disp('能观标准型的矩阵Co:');
    disp(Co);
    disp('能观标准型的矩阵Do:');
    disp(Do);
end