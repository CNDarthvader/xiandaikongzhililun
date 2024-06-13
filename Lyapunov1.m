function Lyapunov1(A)
    % 李雅普诺夫第一法
    % 计算A的特征值
    disp('李雅普诺夫第一法判断如下')
    eigA = eig(A);
    disp('特征值为')
    disp(eigA)
    % 判断稳定性
    if all(real(eigA) < 0)
        disp('所有特征值有负实部，系统全局渐进稳定');
    else
        disp('有特征值不为负，系统不稳定');
    end
end