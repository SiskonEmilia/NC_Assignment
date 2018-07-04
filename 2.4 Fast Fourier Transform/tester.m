fs = 120; % ����Ƶ��
N = 1024; % ��������
n = 0 : N - 1; % ������
t = (n - 1) / fs; % ʱ���

x = 0.2 * sin(2 * pi * 10 * t) + 2 * sin(2 * pi * 30 * t) + 0.8 * sin(2 * pi * 20 * t) + 1.5 * sin(2 * pi * 45 * t); % ���������ź�
y = R2DIT(x); % ��-2���ٸ���Ҷ�任
mag = abs(y); % ��ȡƵ�����
f = n * fs / N;
plot(f(:, (1 : N / 2)), mag(:,(1 : N / 2))); % �������
xlabel('Frequency/Hz');
ylabel('Amplitude');title('N = 1024');