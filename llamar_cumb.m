close all; clear all; clc

canciones={'Cumbia_Banquena' 'Cumbia-sinaguera'};% 'Cumbia1' 'Cumbia2' 'Cumbia3' 'Cumbia4' 'Cumbia5' 'Cumbia6' 'Cumbia7' 'Cumbia8' 'Cumbia9' 'Cumbia10' 'Cumbia11' 'Cumbia12' 'Cumbia13'};
l=length(canciones)

for i=1:1:l
    x=char(canciones(i))
%    figure
    [n, m] = graficar_cumb(x,[10 18]), title([canciones(i) '10-18'])
    bonita_imagen(n,m, 10, 18)
end

for i=1:1:l
    x=char(canciones(i))
%    figure
    [n, m] = graficar_cumb(x,[60 68]), title([canciones(i) '60-68'])
    bonita_imagen(n,m, 60, 68)
end