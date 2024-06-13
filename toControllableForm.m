function [Ac, Bc, Cc, Dc] = toControllableForm(A, B, C, D)
    % 将状态空间模型转换为能控标准型
    % 输入:
    % A, B, C, D - 原始状态空间模型的矩阵
    % 输出:
    % Ac, Bc, Cc, Dc - 能控标准型的矩阵

    % 计算能控矩阵
    Co = ctrb(A, B);
    
    % 检查系统是否完全能控
    if rank(Co) < size(A, 1)
        error('系统不是完全能控的');
    end
    
    % 计算转换矩阵
    T = Co; % 在这个简化的例子中，我们直接使用能控矩阵作为转换矩阵
    
    % 计算能控标准型的矩阵
    Ac = inv(T) * A * T;
    Bc = inv(T) * B;
    Cc = C * T;
    Dc = D; % D矩阵通常保持不变
    
    % 显示结果
    disp('能控标准2型的矩阵Ac:');
    disp(Ac);
    disp('能控标准2型的矩阵Bc:');
    disp(Bc);
    disp('能控标准2型的矩阵Cc:');
    disp(Cc);
    disp('能控标准2型的矩阵Dc:');
    disp(Dc);
end