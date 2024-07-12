% 1. 定义t范围以及f1(t)和f2(t)
dt = 0.01;
t = -10:dt:10;
f1 = abs(t) < 2;
f2 = abs(t) < 3;

% 2. 定义频率范围和计算傅立叶变换
N = length(t);
dW = 2*pi/(N*dt);
W = -pi/dt:dW:pi/dt-dW;

F1 = fftshift(fft(f1)*dt);
F2 = fftshift(fft(f2)*dt);

% 3. 计算f(t)和F(jw)
f = conv(f1,f2,'same') * dt;
F = fftshift(fft(f)*dt);

% 4. 计算F1(jw)F2(jw)和F(jw)
F1F2 = F1 .* F2;

% 5. 画出f1(t)、f2(t)、f(t)
figure;
subplot(2,2,1);
plot(t,f1);
title('f1(t)');
subplot(2,2,2);
plot(t,f2);
title('f2(t)');
subplot(2,2,[3 4]);
plot(t,f);
title('f(t) = f1(t) * f2(t)');

% 6. 画出F1(jw)F2(jw)和F(jw)
figure;
plot(W,abs(F1F2),'g-'); hold on;
plot(W,abs(F),'r--'); hold off;
title('F1(jw)F2(jw) (绿色实线) 和 F(jw) (红色虚线)');
legend('F1(jw)F2(jw)', 'F(jw)');
