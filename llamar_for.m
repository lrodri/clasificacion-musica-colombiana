close all; clear all; clc

canciones={'Corazoncito_mio'}; %'El_Guatecano' 'El_pifano' 'Muchacha_de_risa_loca' 'Ojo_al_toro' 'Trece_de_Junio' 'Bambuco1' 'Bambuco2' 'Bambuco3' 'Bambuco4' 'Bambuco5' 'Bambuco6' 'Bambuco7' 'Bambuco8' 'Bambuco9'};
l=length(canciones)

for i=1:1:l
    x=char(canciones(i))
%    figure
    [n, m] = graficar_bamb(x,[3 4]), title([canciones(i) '3-4'])
    bonita_imagen(n,m, 3, 4)
end

%for i=1:1:l
%    x=char(canciones(i))
%%    figure
%    [n, m] = graficar_bamb(x,[60 68]), title([canciones(i) '60-68'])
%    bonita_imagen(n,m, 60, 68)
%end