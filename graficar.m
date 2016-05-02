%[mat, fs]=similaridad('Adagio-4,27-590-kb.wav', 8, 'x.png');
function graficar(archivo_sin_extension, tiempo)

if (isscalar(tiempo)==1)
% escalar
t_i=sprintf('-%03d', 0)
t_f=sprintf('-%03d', tiempo)

elseif ((isvector(tiempo)==1) && (length(tiempo)==2))
% vector
t_i=sprintf('-%03d', tiempo(1))
t_f=sprintf('-%03d', tiempo(2))
end

arch_wav=[archivo_sin_extension '.wav']
arch_png=[archivo_sin_extension t_i t_f '.png']
arch_pdf=[archivo_sin_extension t_i t_f '.pdf']

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