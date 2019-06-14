%%% Script MATLAB %%%

clear; % Limpio el Workspace

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sistema de segundo orden con realimentación %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Apertura del Modelo de Simulink %%%

%Busco en Programa de Simulink
find_system('Name', 'Modelo_Sistema_Realimentado_Escalon');

%Abre el Programa
open_system('Modelo_Sistema_Realimentado_Escalon');

%Asignamos Valores
set_param('Modelo_Sistema_Realimentado_Escalon/Transfer Fcn', 'Numerator', '[6]');
set_param('Modelo_Sistema_Realimentado_Escalon/Transfer Fcn', 'Denominator', '[1 2 0]');

%Guardamos los cambios
save_system('Modelo_Sistema_Realimentado_Escalon');

%Ejecuta el Programa
sim('Modelo_Sistema_Realimentado_Escalon');

%Creo la Variable t y Genero la Grafica
t = 0:0.01:20;
escalon = yout;
figure(1);
plot(t, escalon);
title('Sistema Realimentado Escalon');
xlabel('Tiempo Normalizado t');
ylabel('Salida y(t) Normalizada en Ganancia');

%Calculamos la Sobreoscilacion
delta = 1/sqrt(6);
sobreoscilacion = exp((-delta*pi)/sqrt(1-delta^2));
fprintf('Sobreoscilacion Mp = %f = %f Por Ciento \n', sobreoscilacion, sobreoscilacion*100);

%Cierra el Programa
close_system('Modelo_Sistema_Realimentado_Escalon');

%Busco en Programa de Simulink
find_system('Name', 'Modelo_Sistema_Realimentado_Rampa');

%Abre el Programa
open_system('Modelo_Sistema_Realimentado_Rampa');

%Asignamos Valores
set_param('Modelo_Sistema_Realimentado_Rampa/Transfer Fcn', 'Numerator', '[6]');
set_param('Modelo_Sistema_Realimentado_Rampa/Transfer Fcn', 'Denominator', '[1 2 0]');

%Guardamos los cambios
save_system('Modelo_Sistema_Realimentado_Rampa');

%Ejecuta el Programa
sim('Modelo_Sistema_Realimentado_Rampa');

%Genero la Grafica
rampa = yout;
figure(2);
plot(t, rampa);
title('Sistema Realimentado Rampa');
xlabel('Tiempo Normalizado t');
ylabel('Salida y(t) Normalizada en Ganancia');

%Cierra el Programa
close_system('Modelo_Sistema_Realimentado_Rampa');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sistema realimentado con controlador PI %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; % Limpio el Workspace

%%% Apertura del Modelo de Simulink %%%

%Busco en Programa de Simulink
find_system('Name', 'Modelo_Sistema_Realimentado_PI_Escalon');

%Abre el Programa
open_system('Modelo_Sistema_Realimentado_PI_Escalon');

%Asignamos Valores
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn', 'Numerator', '[6]');
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn', 'Denominator', '[1 2 0]');
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn1', 'Numerator', '[1 1]');
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn1', 'Denominator', '[0 1 0]');

%Guardamos los cambios
save_system('Modelo_Sistema_Realimentado_PI_Escalon');

%Ejecuta el Programa
sim('Modelo_Sistema_Realimentado_PI_Escalon');

%Creo la Variable t y Genero la Grafica
t = 0:0.01:20;
escalon = yout;
figure(3);
plot(t, escalon);
title('Sistema Realimentado PI Escalon');
xlabel('Tiempo Normalizado t');
ylabel('Salida y(t) Normalizada en Ganancia');

%Calculamos la Sobreoscilacion
delta = 3/sqrt(6);
sobreoscilacion = exp((-delta*pi)/sqrt(1-delta^2));
fprintf('Sobreoscilacion (PI) Mp = %f = %f Por Ciento \n', sobreoscilacion, sobreoscilacion*100);

%Cierra el Programa
close_system('Modelo_Sistema_Realimentado_PI_Escalon');

%Busco en Programa de Simulink
find_system('Name', 'Modelo_Sistema_Realimentado_PI_Rampa');

%Abre el Programa
open_system('Modelo_Sistema_Realimentado_PI_Rampa');

%Asignamos Valores
set_param('Modelo_Sistema_Realimentado_PI_Rampa/Transfer Fcn', 'Numerator', '[6]');
set_param('Modelo_Sistema_Realimentado_PI_Rampa/Transfer Fcn', 'Denominator', '[1 2 0]');
set_param('Modelo_Sistema_Realimentado_PI_Rampa/Transfer Fcn1', 'Numerator', '[1 1]');
set_param('Modelo_Sistema_Realimentado_PI_Rampa/Transfer Fcn1', 'Denominator', '[0 1 0]');

%Guardamos los cambios
save_system('Modelo_Sistema_Realimentado_PI_Rampa');

%Ejecuta el Programa
sim('Modelo_Sistema_Realimentado_PI_Rampa');

%Genero la Grafica
rampa = yout;
figure(4);
plot(t, rampa);
title('Sistema Realimentado PI Rampa');
xlabel('Tiempo Normalizado t');
ylabel('Salida y(t) Normalizada en Ganancia');

%Cierra el Programa
close_system('Modelo_Sistema_Realimentado_PI_Rampa');

%%% Modifico los Valores de Kp y Obtengo las Graficas %%%

%Busco en Programa de Simulink
find_system('Name', 'Modelo_Sistema_Realimentado_PI_Escalon');

%Abre el Programa
open_system('Modelo_Sistema_Realimentado_PI_Escalon');

%Asignamos Valores
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn1', 'Numerator', '[1.3 1]');
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn1', 'Denominator', '[0 1 0]');

%Guardamos los cambios
save_system('Modelo_Sistema_Realimentado_PI_Escalon');

%Ejecuta el Programa
sim('Modelo_Sistema_Realimentado_PI_Escalon');

%Creo la Variable t y Genero la Grafica
escalon2 = yout;

%Asignamos Valores
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn1', 'Numerator', '[1.5 1]');
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn1', 'Denominator', '[0 1 0]');

%Guardamos los cambios
save_system('Modelo_Sistema_Realimentado_PI_Escalon');

%Ejecuta el Programa
sim('Modelo_Sistema_Realimentado_PI_Escalon');

%Obtengo los Resultados
escalon3 = yout;

%Asignamos Valores
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn1', 'Numerator', '[2 1]');
set_param('Modelo_Sistema_Realimentado_PI_Escalon/Transfer Fcn1', 'Denominator', '[0 1 0]');

%Guardamos los cambios
save_system('Modelo_Sistema_Realimentado_PI_Escalon');

%Ejecuta el Programa
sim('Modelo_Sistema_Realimentado_PI_Escalon');

%Obtengo los Resultados
escalon4 = yout;

%Genero la Grafica
figure(5);
plot(t, escalon, t, escalon2, t, escalon3, t, escalon4);
title('Sistema Realimentado PI Rampa');
xlabel('Tiempo Normalizado t');
ylabel('Salida y(t) Normalizada en Ganancia');

%Cierra el Programa
close_system('Modelo_Sistema_Realimentado_PI_Escalon');