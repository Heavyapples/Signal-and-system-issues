%% Q3
t = linspace(-pi,pi,1000);
f_t = zeros(size(t));
% 在各个区间内定义函数
f_t(t >= -pi & t < 0) = t(t >= -pi & t < 0) + pi;
f_t(t >= 0 & t <= pi) = pi - t(t >= 0 & t <= pi);
% 画出函数图像
figure;
plot(t, f_t);
title('f(t)');
% f(t)的傅立叶变换
F_jw = fft(f_t);
% 将零频率点移到中心
F_jw = fftshift(F_jw);
% 频率向量（我们使用了fftshift）
w = (-pi:2*pi/999:pi) * (1000/(2*pi));
% 画出傅立叶变换图像
figure;
plot(w, abs(F_jw));
title('f(t)的傅立叶变换');
% 计算df(t)/dt
df_t = gradient(f_t) / (t(2)-t(1));
% 画出df(t)/dt的图像
figure;
plot(t, df_t);
title('df(t)/dt');
% df(t)/dt的傅立叶变换
F1_jw = fft(df_t);
% 将零频率点移到中心
F1_jw = fftshift(F1_jw);
% 画出df(t)/dt的傅立叶变换图像
figure;
plot(w, abs(F1_jw));
title('df(t)/dt的傅立叶变换');
% 比较abs(F1_jw)和abs(j*w.*F_jw)时域函数的微分对应于频域函数与频率的乘积
figure;
plot(w, abs(F1_jw), w, abs(j*w.*F_jw));
title('比较df(t)/dt的傅立叶变换和j\omega*F(j\omega)');
legend('abs(F1(j\omega))', 'abs(j\omega*F(j\omega))');
