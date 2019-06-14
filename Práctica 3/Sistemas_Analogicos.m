%%% Script MATLAB %%%

clear; % Limpio el Workspace

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sistemas de Segundo Orden %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Apertura del Modelo de Simulink %%%

%Busco en Programa de Simulink (Modelo_Sistemas_Analogicos.slx)
find_system('Name', 'Modelo_Sistemas_Analogicos');

%Abre el Programa
open_system('Modelo_Sistemas_Analogicos');

%%% Sistema Subamortiguado %%%

%Asignamos Valores - Sistema Subamortiguado(w_n = 1) (delta = 0.5)
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Numerator', '[1]');
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Denominator', '[1 2*0.5*1 1]');

%Guardamos los cambios
save_system('Modelo_Sistemas_Analogicos');

%Ejecuta el Programa
sim('Modelo_Sistemas_Analogicos');

%Creo la Variable t y Genero la Grafica
t = 0:0.01:20;
a1 = yout;
figure(1);
plot(t, yout);
title('Sistema Subamortiguado');
xlabel('Tiempo Normalizado t (w_n = 1)');
ylabel('Salida y(t) Normalizada en Ganancia');

%Sobreoscilación - Tiempo de Pico - Tiempo de Establecimiento al 2%
delta = 0.5;
wn = 1;
sobreoscilacion = exp((-delta*pi)/sqrt(1-delta^2));
tPico = pi/(1*sqrt(wn-delta^2));
tEstablecimiento = -(log(0.02*sqrt(1-delta^2))/(wn*delta));

%Print de los resultados
fprintf('Sistema Subamortiguado \n');
fprintf('Sobreoscilacion Mp = %f = %f Por Ciento \n', sobreoscilacion, sobreoscilacion*100);
fprintf('Tiempo de Pico tp = %f Segundos \n', tPico);
fprintf('Tiempo de Establecimiento ts = %f Segundos \n\n', tEstablecimiento);

%%% Sistema Criticamente Amortiguado %%%

%Asignamos Valores - Sistema Criticamente Amortiguado (w_n = 1) (delta = 1)
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Numerator', '[1]');
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Denominator', '[1 2*1*1 1]');

%Guardamos los cambios
save_system('Modelo_Sistemas_Analogicos');

%Ejecuta el Programa
sim('Modelo_Sistemas_Analogicos');

%Creo la Variable t y Genero la Grafica
a2 = yout;
figure(2);
plot(t, yout);
title('Sistema Criticamente Amortiguado');
xlabel('Tiempo Normalizado t (w_n = 1)');
ylabel('Salida y(t) Normalizada en Ganancia');

%Sobreoscilación - Tiempo de Pico - Tiempo de Establecimiento al 2%
delta = 1;
wn = 1;
sobreoscilacion = exp((-delta*pi)/sqrt(1-delta^2));
tPico = pi/(1*sqrt(wn-delta^2));
tEstablecimiento = -(log(0.02*sqrt(1-delta^2))/(wn*delta));

%Print de los resultados
fprintf('Sistema Criticamente Amortiguado \n');
fprintf('Sobreoscilacion Mp = %f = %f Por Ciento \n', sobreoscilacion, sobreoscilacion*100);
fprintf('Tiempo de Pico tp = %f Segundos \n', tPico);
fprintf('Tiempo de Establecimiento ts = %f Segundos \n\n', tEstablecimiento);

%%% Sistema Sobreamortiguado %%%

%Asignamos Valores - Sistema Sobreamortiguado (w_n = 1) (delta = 1.5)
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Numerator', '[1]');
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Denominator', '[1 2*1.5*1 1]');

%Guardamos los cambios
save_system('Modelo_Sistemas_Analogicos');

%Ejecuta el Programa
sim('Modelo_Sistemas_Analogicos');

%Creo la Variable t y Genero la Grafica
a3 = yout;
figure(3);
plot(t, yout);
title('Sistema Sobreamortiguado');
xlabel('Tiempo Normalizado t (w_n = 1)');
ylabel('Salida y(t) Normalizada en Ganancia');

%Sobreoscilación - Tiempo de Pico - Tiempo de Establecimiento al 2%
delta = 1.5;
wn = 1;
sobreoscilacion = exp((-delta*pi)/sqrt(1-delta^2));
tPico = pi/(1*sqrt(wn-delta^2));
tEstablecimiento = -(log(0.02*sqrt(1-delta^2))/(wn*delta));

%Print de los resultados
fprintf('Sistema Sobreamortiguado \n');
fprintf('Sobreoscilacion Mp = %f = %f Por Ciento \n', sobreoscilacion, sobreoscilacion*100);
fprintf('Tiempo de Pico tp = %f Segundos \n', tPico);
fprintf('Tiempo de Establecimiento ts = %f Segundos \n\n', tEstablecimiento);

%Genero la Grafica Conjunta
figure(4);
plot(t, a1, t, a2, t, a3);
title('Sistemas de Segundo Orden');
xlabel('Tiempo Normalizado t (w_n = 1)');
ylabel('Salida y(t) Normalizada en Ganancia');

clear; % Limpio el Workspace

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funciones de Transferencia con Ceros %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Creamos las Variables Necesarias

t = 0:0.01:20;

%Asignamos Valores - Sistema Subamortiguado (w_n = 1) (delta = 0.5) (a = 1)
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Numerator', '[1 1]');
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Denominator', '[1 1 1]');

%Guardamos los cambios
save_system('Modelo_Sistemas_Analogicos');

%Ejecuta el Programa
sim('Modelo_Sistemas_Analogicos');
a1 = yout;
fprintf('Para a = 1 -> \n');
fprintf('|z0| = %f > %f \n\n', abs(-1/1), 5*1*0.5);

%Asignamos Valores - Sistema Subamortiguado (w_n = 1) (delta = 0.5) (a = 0.5)
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Numerator', '[0.5 1]');
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Denominator', '[1 1 1]');

%Guardamos los cambios
save_system('Modelo_Sistemas_Analogicos');

%Ejecuta el Programa
sim('Modelo_Sistemas_Analogicos');

%Obtencion de Resultados y Print
a2 = yout;
fprintf('Para a = 0.5 -> \n');
fprintf('|z0| = %f > %f \n\n', abs(-1/0.5), 5*1*0.5);

%Asignamos Valores - Sistema Subamortiguado (w_n = 1) (delta = 0.5) (a = 0.2)
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Numerator', '[0.2 1]');
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Denominator', '[1 1 1]');

%Guardamos los cambios
save_system('Modelo_Sistemas_Analogicos');

%Ejecuta el Programa
sim('Modelo_Sistemas_Analogicos');
a3 = yout;
fprintf('Para a = 0.2 -> \n');
fprintf('|z0| = %f > %f \n\n', abs(-1/0.2), 5*1*0.5);

%Asignamos Valores - Sistema Subamortiguado (w_n = 1) (delta = 0.5) (a = 0.1)
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Numerator', '[0.1 1]');
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Denominator', '[1 1 1]');

%Guardamos los cambios
save_system('Modelo_Sistemas_Analogicos');

%Ejecuta el Programa
sim('Modelo_Sistemas_Analogicos');
a4 = yout;
fprintf('Para a = 0.1 -> \n');
fprintf('|z0| = %f > %f \n\n', abs(-1/0.1), 5*1*0.5);

%Asignamos Valores - Sistema Subamortiguado (w_n = 1) (delta = 0.5) (a = 0.05)
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Numerator', '[0.05 1]');
set_param('Modelo_Sistemas_Analogicos/Transfer Fcn', 'Denominator', '[1 1 1]');

%Guardamos los cambios
save_system('Modelo_Sistemas_Analogicos');

%Ejecuta el Programa
sim('Modelo_Sistemas_Analogicos');
a5 = yout;
fprintf('Para a = 0.05 -> \n');
fprintf('|z0| = %f > %f \n\n', abs(-1/0.05), 5*1*0.5);

%Obtencion de Graficas
figure(5);
plot(t, a1, t, a2, t, a3, t, a4, t, a5);
title('Funciones de Transferencia con Ceros');

%%% Cierre del Modelo de Simulink

%Cierra el Programa
close_system('Modelo_Sistemas_Analogicos');