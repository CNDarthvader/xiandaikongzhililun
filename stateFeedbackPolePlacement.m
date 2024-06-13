function stateFeedbackPolePlacement(A, B)
    % 计算系统的阶数，即矩阵A的行数
    systemOrder = size(A, 1);
    fprintf('系统的阶数为 %d，因此您需要输入 %d 个极点。\n', systemOrder, systemOrder);
    desiredPoles = input('请输入期望的闭环极点，格式如[-1, -2]: ');
    % 使用place函数计算状态反馈矩阵K
    K = place(A, B, desiredPoles);
    A_cl = A - B*K;
    % 显示结果
    disp('状态反馈矩阵K:');
    disp(K);
    disp('闭环状态方程矩阵A_cl:');
    disp(A_cl);
end