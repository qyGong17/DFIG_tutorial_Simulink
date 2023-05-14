close
t = 0:0.2*1e-3:0.02;
f = 50;

% 三相电压，正序
va = 100*cos(2*pi*f*t);
vb = 100*cos(2*pi*f*t - 2*pi/3);
vc = 100*cos(2*pi*f*t + 2*pi/3);

% 三相电压被放置在空间上的不同位置
% 空间上的位置，令a相为0°
% b相超前a相120°，即位于2*pi/3
% c相滞后a相120°，即位于-2*pi/3
% 也就是说这三个矢量的方向不变，幅值随时间变化（幅值可以为负值）
% 后缀_c表示是矢量，实部为在α轴上的投影，虚部为β轴上的投影
va_c = va;
vb_c = vb*cos(2*pi/3) + 1i*vb*sin(2*pi/3);
vc_c = vc*cos(-2*pi/3) + 1i*vc*sin(-2*pi/3);

v_sum = va_c + vb_c + vc_c; % 三个矢量的合成结果

subplot(2,1,1)
plot(t,va,t,vb,t,vc,t,va+vb+vc);
legend('v_a','v_b','v_c','v_a+v_c+v_c'); 
title('瞬时值之和')
%可以看到在时间上，三相电压之和是0

subplot(2,1,2)
plot(real(v_sum),imag(v_sum),'.');
axis equal
hold on
% 三相电压在空间上错开120°，合成结果落在一个圆上，且半径为1.5倍的相电压幅值
% 这里画了某个时刻的三个矢量的合成结果
ii = 40;
plot([0,real(va_c(ii))],[0,imag(va_c(ii))]);
plot([0,real(vb_c(ii))],[0,imag(vb_c(ii))]);
plot([0,real(vc_c(ii))],[0,imag(vc_c(ii))]);
plot([0,real(v_sum(ii))],[0,imag(v_sum(ii))]);
legend('sum','v_a','v_b','v_c','sum(ii)');
title('空间上的合成')