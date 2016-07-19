close all; clear all; clc

canciones={'Tina'};% 'Monalinda' 'El_sabroson' 'Atlantico' 'Carmen_de_Bolivar' 'La_vaca_vieja' 'Peluquero' 'San_Carlos' 'San_Fernando' 'Merecumbe' 'Pajaro-picon' 'Porro1' 'Porro2' 'Porro3' 'Porro4'};
l=length(canciones)

for i=1:1:l
    x=char(canciones(i))
%    figure
    [n, m] = graficar_porro(x,[10 18]), title([canciones(i) '10-18'])
    bonita_imagen(n,m, 10, 18)
end

for i=1:1:l
    x=char(canciones(i))
%    figure
    [n, m] = graficar_porro(x,[60 68]), title([canciones(i) '60-68'])
    bonita_imagen(n,m, 60, 68)
end