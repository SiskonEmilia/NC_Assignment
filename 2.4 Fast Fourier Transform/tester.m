fs = 120; % 采样频率
N = 1024; % 采样点数
n = 0 : N - 1; % 采样点
t = (n - 1) / fs; % 时间点

x = 0.2 * sin(2 * pi * 10 * t) + 2 * sin(2 * pi * 30 * t) + 0.8 * sin(2 * pi * 20 * t) + 1.5 * sin(2 * pi * 45 * t); % 生成正弦信号
y = R2DIT(x); % 基-2快速傅里叶变换
mag = abs(y); % 获取频率振幅
f = n * fs / N;
plot(f(:, (1 : N / 2)), mag(:,(1 : N / 2))); % 绘制振幅
xlabel('Frequency/Hz');
ylabel('Amplitude');title('N = 1024');