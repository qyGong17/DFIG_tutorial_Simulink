% Rg = 20e-6; % Grid side filter's resisatance
% Lg = 400e-6; % Grid side filter's inductance
% wnig = 60*2*pi;
% num_g = [2*wnig-Rg/Lg, wnig^2];
% den_g = [1, 2*wnig, wnig^2];
% 
% wnig2 = 120*2*pi;
% num_g2 = [2*wnig2-Rg/Lg, wnig2^2];
% den_g2 = [1, 2*wnig2, wnig2^2];
% step(num_g,den_g)
% hold on 
% step(num_g2,den_g2)
% figure(2)
% bode(num_g,den_g)
% hold on 
% bode(num_g2,den_g2)



% RSC current PI
tau_i = (sigma*Lr)/Rr;
wni = 100*(1/tau_i)/5; % 1/5 of Tutorial 1
kp_id = (2*wni*sigma*Lr)-Rr;
kp_iq = kp_id;
ki_id = (wni^2)*Lr*sigma;
ki_iq = ki_id;

% GSC current PI 
tau_ig = Lg/Rg;
wnig = 60*2*pi;
kp_idg = (2*wnig*Lg)-Rg;
kp_iqg = kp_idg; 
ki_idg = (wnig^2)*Lg;
ki_iqg = ki_idg;

% compare bode 
num_r = [2*wni-Rr/(sigma*Lr), wni^2];
den_r = [1, 2*wni, wni^2];
num_g = [2*wnig-Rg/Lg, wnig^2];
den_g = [1, 2*wnig, wnig^2];

bode(num_g,den_g)
hold on 
bode(num_r,den_r)