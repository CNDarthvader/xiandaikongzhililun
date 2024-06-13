function Lyapunov2(A)
    %李雅普诺夫第二法
    % 定义单位矩阵Q
    disp('李雅普诺夫第二法判断如下')
    Q = eye(size(A));
    P = lyap(A, -Q);
    disp('李雅普诺夫方程的解为')
    disp(P)
    % 计算P的转置
    P_transpose = P';
    % 检查P是否等于其转置
    is_symmetric = isequal(P, P_transpose);
    if is_symmetric
       disp('P是对称矩阵。');
        disp('特征值为')
        disp(eig(P))
        if all(eig(P) < 0)
            disp('P是存在且正定的，系统全局渐进稳定')
        else
            disp('P不是正定的，系统不稳定') 
        end
    else
        disp('P不是对称矩阵。系统可能不是渐进稳定的，建议使用其他方法验证');
    end
end