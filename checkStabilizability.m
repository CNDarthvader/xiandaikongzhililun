function checkStabilizability(A)
    % 检查系统是否是镇定的
    % 计算A的特征值
    eigenvalues = eig(A);
    % 初始化镇定标志
    isStabilizable = true;
    % 检查每个特征值
    for i = 1:length(eigenvalues)
        if real(eigenvalues(i)) > 0
            % 如果存在实部大于0的特征值，则系统不是镇定的
            isStabilizable = false;
            break;
        end
    end
    % 如果所有特征值的实部都小于或等于零，则系统可能是镇定的
    if isStabilizable
        disp('所有特征值的实部都小于或等于零，系统是镇定的。');
    else
        disp('存在实部大于0的特征值，系统不是镇定的。');
    end
end