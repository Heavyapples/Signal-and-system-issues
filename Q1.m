%% Q1
t = -10:0.01:10; % 定义时间轴
dt = t(2) - t(1); % 计算时间步长
fs = 1/dt; % 计算采样频率

% 定义信号f1(t)和f2(t)
f1 = abs(t) < 2; % g4(t)
f2 = abs(t) < 3; % g6(t)

% 绘制时域图像
figure;
subplot(2,1,1);
plot(t, f1);
title('f1(t) = abs(t) < 2');
subplot(2,1,2);
plot(t, f2);
title('f2(t) = abs(t) < 3');

% 进行零填充
N = 100*length(t); 
f1_padded = [f1, zeros(1, N-length(t))]; 
f2_padded = [f2, zeros(1, N-length(t))]; 

% 求傅里叶变换并将零频移到中心
F1 = abs(fftshift(fft(f1_padded))); 
F2 = abs(fftshift(fft(f2_padded))); 

% 创建频率轴
f_axis = linspace(-fs/2, fs/2, N);

% 绘制频域图像
figure;
subplot(2,1,1);
plot(f_axis, F1);
title('F1(j\omega)');
subplot(2,1,2);
plot(f_axis, F2);
title('F2(j\omega)');

% 相加两个信号
f = f1 + f2;

% 进行零填充
f_padded = [f, zeros(1, N-length(t))];

% 绘制时域图像
figure;
plot(t, f);
title('f(t) = f1(t) + f2(t)');

% 求f(t)的傅里叶变换并绘制
F = abs(fftshift(fft(f_padded)));
figure;
plot(f_axis, F);
title('F(j\omega)');
