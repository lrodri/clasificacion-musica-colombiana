function [arch_no_png, arch_png_bonito]=graficar_porro(archivo_sin_extension, tiempo)

% ---------------------------------------------------------------------------------------
% Esta funcion permite graficar las matrices de similitud para los generos musicales
% ingresados de la carpeta porro, sin extension, en el primer parametro de entrada 
% 'archivo_sin_extension', estas matrices se logran calcular para cierto periodo de tiempo
% ingresado en el segundo parametro 'tiempo' ya sea como escalar o como vector. Si se 
% ingresa como escalar, el parametro de tiempo sera de cero (0) al valor de tiempo 
% ingresado.
% 
% Como parametros de salida tenemos:
% - arch_no_png: nombre del archivo png guardado en la carpeta 'imagen/' sin extension
% - arch_png_bonito: nombre del archivo png guardado en la carpeta 'bonito/' sin extension
% ---------------------------------------------------------------------------------------

if (isscalar(tiempo)==1)
% escalar
t_i=sprintf('-%03d', 0)
t_f=sprintf('-%03d', tiempo)

elseif ((isvector(tiempo)==1) && (length(tiempo)==2))
% vector
t_i=sprintf('-%03d', tiempo(1))
t_f=sprintf('-%03d', tiempo(2))
end

arch_wav=['canciones/porro/' archivo_sin_extension '.wav']
arch_png=['imagen/' archivo_sin_extension t_i t_f '.png']
arch_pdf=['espectro/' archivo_sin_extension t_i t_f '.pdf']
arch_png_bonito=['imagen/bonito/' archivo_sin_extension t_i t_f]
arch_no_png=['imagen/' archivo_sin_extension t_i t_f]

[mat,fs]=similaridad(arch_wav, tiempo, arch_png);
fs
tam_mat_sim=size(mat)

%ts=100
%t=4
%x=t*ts
%mat=rand(x);
%tam=size(x);

esp_ritmo=espectro_ritmo(mat);
length(esp_ritmo)
t=((0:length(esp_ritmo)-1)/fs)*128;
plot(t,esp_ritmo);
print(arch_pdf, '-dpdf');

end