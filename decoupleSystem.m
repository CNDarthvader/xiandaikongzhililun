function [Ad, Bd, Cd, Dd] = decoupleSystem(A, B, C, D)
    % 解耦给定的状态空间模型
    % 输入:
    % A, B, C, D - 原始状态空间模型的矩阵
    % 输出:
    % Ad, Bd, Cd, Dd - 解耦后的状态空间模型的矩阵

    % 计算A矩阵的特征值和特征向量
    [V, D] = eig(A);
    
    % 检查是否可以解耦
    if rank(V) < size(A, 1)
        error('系统不能完全解耦');
    end
    
    % 使用特征向量矩阵对系统进行变换
    Ad = inv(V) * A * V;
    Bd = inv(V) * B;
    Cd = C * V;
    Dd = D ; % D矩阵通常保持不变
    
    % 显示解耦后的矩阵
    disp('解耦后的A矩阵:');
    disp(Ad);
    disp('解耦后的B矩阵:');
    disp(Bd);
    disp('解耦后的C矩阵:');
    disp(Cd);
    disp('解耦后的D矩阵:');
    disp(Dd);
end