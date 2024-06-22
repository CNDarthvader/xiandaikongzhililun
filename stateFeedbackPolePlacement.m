function stateFeedbackPolePlacement(A,B,C,D)
a = A;
b = B;
c = C;
d = D;
disp('可控性矩阵的秩')
rc = rank(ctrb(a,b))
systemOrder = size(A, 1);

fprintf('系统的阶数为 %d，因此您需要输入期望极点的个数为 %d 。', systemOrder, systemOrder);
ran2 = randi([1,10],systemOrder,1);
fprintf('例如%s \n',mat2str(ran2))
p = input('输入期望极点：');
k=place(a,b,p);%极点配置
fprintf('反馈增益矩阵为：')
k
a1=a-b*k;
b1=b*k(1);
c1=c;
d1=d;%配置后的闭环状态空间矩阵
figure(1)       %绘图
step(a1,b1,c1,d1)%加入阶跃响应
title('状态变量的阶跃响应')
figure(2)       %求出响应图
[y,x,t]=step(a1,b1,c1,d1);
plot(t,x)
title('状态变量x1,x2,x3,x4,x5的阶跃响应')
figure(3)
plot(t,y)
title('输出y的阶跃响应')
grid on

sys = ss(a1,b1,c1,d1);
[Num, Den] = tfdata(sys, 'v'); % 'v' 选项返回向量形式的分子和分母
NumArray = cell2mat(Num); % 将cell数组转换为普通数组
DenArray = cell2mat(Den); % 同上
Numarray = NumArray(1,:);
Denarray = DenArray(1,:);
% fprintf('闭环传递函数的分子: %s\n', mat2str(Numarray));
% fprintf('闭环传递函数的分母: %s\n', mat2str(Denarray));
disp('闭环传递函数')
G1=tf(Numarray,Denarray)
assignin('base', 'k', k);
assignin('base', 'a1', a1)
assignin('base', 'b1', b1)
assignin('base', 'c1', c1)
assignin('base', 'd1', d1)
end