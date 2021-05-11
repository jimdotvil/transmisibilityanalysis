% % Matlab script to calculate Transmissibility versus
% the frequency ratio, isolator natural frequency and for different damping ratios.
% 

clear
clc
close all

zeta = [.01;.10;.15;.25;.3;.5;1.0];        % Damping Factors
om = 0:1:100;                                    % Frequency
omnat=40; %natural frequency isolator
omega=om./omnat;
%
for i=1:length(zeta)
    fn = sqrt(1+(2.*zeta(i).*omega).^2);
    fd = sqrt((1-omega.^2).^2+(2.*zeta(i).*omega).^2);
   Td(i,:)= fn./fd;
end

valuestr=Td(:,60);

plot(omega,Td)
hold on
xlabel('Frequency Ratio  \omega / \omega_{n}')
ylabel('Transmissibilty TR')
legend('\zeta_1=0.01','\zeta_2=0.1','\zeta_3=0.25','\zeta_4=0.3',...
    '\zeta_5=0.5','\zeta_6=1');
axis([0 3 0 3]);
grid on

figure(2)
plot(om,Td)
xlabel('Frequency  \omega')
ylabel('Transmissibilty TR')
legend('\zeta_1=0.01','\zeta_2=0.1','\zeta_3=0.25','\zeta_4=0.3',...
    '\zeta_5=0.5','\zeta_6=1');
axis([25 100 0.5 1.5]);
grid on
text(36,0.6,'\omega_{n, isol}=40Hz')
text(56,1.15,'\omega_{eng}=60Hz')
