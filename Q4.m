% 读取图片
img1 = imread('1.jpg');
img2 = imread('2.jpg');

% 将 img2 调整到跟 img1 一样的大小
img2 = imresize(img2, [size(img1, 1), size(img1, 2)]);

% 确保图像为灰度图像
if size(img1, 3) == 3
    img1 = rgb2gray(img1);
end

if size(img2, 3) == 3
    img2 = rgb2gray(img2);
end

% 计算傅立叶变换
F1 = fft2(double(img1));
F2 = fft2(double(img2));

% 计算幅度谱和相位谱
magnitude1 = abs(F1);
magnitude2 = abs(F2);
phase1 = angle(F1);
phase2 = angle(F2);

% 交换相位
F1_new = magnitude1 .* exp(1i*phase2);
F2_new = magnitude2 .* exp(1i*phase1);

% 逆傅立叶变换
img1_new = real(ifft2(F1_new));
img2_new = real(ifft2(F2_new));

% 显示原始图像和新图像
figure;
subplot(2,2,1); imshow(img1); title('man');
subplot(2,2,2); imshow(img2); title('woman');
subplot(2,2,3); imshow(img1_new, []); title('man幅度和woman相位结合');
subplot(2,2,4); imshow(img2_new, []); title('woman幅度和man相位结合');
