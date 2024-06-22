function stateFeedbackPolePlacement(A,B,C,D)
a = A;
b = B;
c = C;
d = D;
disp('The rank of controllability matrix')
rc = rank(ctrb(a,b))
systemOrder = size(A, 1);
fprintf('系统的阶数为 %d，因此您需要输入期望极点的个数为 %d 。', systemOrder, systemOrder);
ran2 = randi([1,10],systemOrder,1);
fprintf('例如%s \n',mat2str(ran2))
p = input('输入初始状态：');
k=place(a,b,p)
a1=a-b*k;b1=b*k(1);c1=c;d1=d;
figure(1)
step(a1,b1,c1,d1)
title('Step Responese of Designed Servo System')
figure(2)
[y,x,t]=step(a1,b1,c1,d1);
plot(t,x)
title('Step Responese Curves for x1,x2,x3,x4')
grid on
disp('The rank of controllability matrix')
rc = 4;
num=[4.55 0];
den=[1 0.182 -31.18 -4.45];
G1=tf(num,den);
G2=tf([8.5 99.4 300],[1 0]);
G=series(G2,G1);
H1=1;
G0=feedback(G,H1)
GG=zpk(G0)
g=ss(a1,b1,c1,d1)
end