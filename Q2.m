syms t w;

f1 = 0.5*(t+1)*heaviside(t+1) - 0.5*(t+1)*heaviside(t-1);
F1 = fourier(f1, t, w);

f2 = subs(f1, t, t-2);
F2 = simplify(fourier(f2, t, w));

f3 = f2*cos(100*t);
F3 = simplify(fourier(f3, t, w));

w = linspace(-10, 10, 500); 

F1_value = double(subs(F1,w));
F2_value = double(subs(F2,w));
F3_value = double(subs(F3,w));

subplot(3,2,1); plot(w, abs(F1_value)); title('F1(jw)幅度频谱图');
subplot(3,2,2); plot(w, unwrap(angle(F1_value))); title('F1(jw)相位频谱图');

subplot(3,2,3); plot(w, abs(F2_value)); title('F2(jw)幅度频谱图');
subplot(3,2,4); plot(w, unwrap(angle(F2_value))); title('F2(jw)相位频谱图');

subplot(3,2,5); plot(w, abs(F3_value)); title('F3(jw)幅度频谱图');
subplot(3,2,6); plot(w, unwrap(angle(F3_value))); title('F3(jw)相位频谱图');
