function [diferente, Fs] = similaridad(cancion,tiempo,imagen)
 
 %% [A, Fs] = similaridad(cancion, tiempo, imagen)
 %% Calcula la matriz de similaridad de un archivo wav
 %% durante un tiempo y crea un archivo png con la matriz
 %% 
 %% cancion: cadena de caracteres con la ruta hacia el archivo d
 %%          donde está la canción
 %% tiempo: en segundos que se va a calcular la matriz de similaridad
 %% imagen: cadena de caracteres con el nombre de la imagen a crear
 %%         debe ser png
 %% 
 %% Retorna
 %% A: matriz cuadrada de tamaño tiempo*Fs
 %% Fs: frecuencia de muestreo
 %%
 %% ver "The beat spectrum: a new approach to rhythm analisis"
 %% Jonathan Foote y Shingo Uchihashi
 
 vent=2^8; % tamaño de ventana 
 [Y,Fs,bps]=wavread(cancion,[1 100]); %leemos frecuencia de muestreo Fs
 Fs
 %Fs=Fs*2
 
 if (isscalar(tiempo)==1)
        n_muestras=tiempo*Fs; %numero de muestras que vamos a leer del archivo
        n_marcos=floor(n_muestras/vent);
        [datos,Fs,bps]=wavread(cancion,(n_marcos+1)*vent);
        
        elseif ((isvector(tiempo)==1) && (length(tiempo)==2))
        n_muestras=(tiempo(2)-tiempo(1))*Fs;
        n_marcos=floor(n_muestras/vent);
        muestras=tiempo.*Fs;
        [datos,Fs,bps]=wavread(cancion,[muestras(1) muestras(1)+(n_marcos+1)*vent]);
        
        %Fs=Fs/2;
        
end     
        size(datos)
        %downsample(datos,2);
        datos=datos(:,1);
        size(datos)
        %xxx=input('___')   
                
        marcos_sup=(n_marcos+1)*2-1;
        parametros=zeros(marcos_sup, vent);

      for i=0:marcos_sup-1
        inicio=i*(vent/2)+1;
        fin=inicio+vent-1;
        parametros(i+1,:)=param_vec(datos(inicio:fin), vent, 1/Fs);
      end

    diferente=zeros(marcos_sup-1,marcos_sup-1);

    for i=1:marcos_sup
          for j=1:marcos_sup
              if j>=i
              diferente(i,j) = angulo_coseno(parametros(i,:), parametros(j,:));
              end
          end
    end
    imwrite(real(diferente), imagen);
    
%     elseif ((isvector(tiempo)==1) && (length(tiempo)=2))
%        n_muestras=tiempo*Fs;
%        n_marcos=ceil(n_muestras/vent);
%        [datos,Fs,bps]=wavread(cancion,(n_marcos+1)*vent);
%        marcos_sup=(n_marcos+1)*2-1;
%        parametros=zeros(marcos_sup, vent);
%
%      for i=1:marcos_sup
%        inicio=i*128;
%        fin=inicio+vent-1;
%        parametros(i,:)=param_vec(datos(inicio:fin));
%      end
%    diferente=zeros(marcos_sup-1,marcos_sup-1);
%
%    for i=1:marcos_sup
%          for j=1:marcos_sup
%              %if j>=i
%              diferente(i,j) = angulo_coseno(parametros(i,:), parametros(j,:));
%              %end
%          end
%    end
%    imwrite(diferente, imagen);
% 
%        else
%        error ("El vector tiempo debe tener unicamente un parametro inicial y uno final");
%

  
end

%        n_muestras=tiempo*Fs;
%        n_marcos=ceil(n_muestras/vent);
%        [datos,Fs,bps]=wavread(cancion,(n_marcos+1)*vent);
%        marcos_sup=(n_marcos+1)*2-1;
%        parametros=zeros(marcos_sup, vent);
%        
%	for i=1:marcos_sup
%            inicio=i*128;
%            fin=inicio+vent-1;
%            parametros(i,:)=param_vec(datos(inicio:fin));
%    end
%        diferente=zeros(marcos_sup-1,marcos_sup-1);
%
%    for i=1:marcos_sup
%            for j=1:marcos_sup
%                %if j>=i
%                diferente(i,j) = angulo_coseno(parametros(i,:), parametros(j,:));
%                %end
%            end
%    end
%    imwrite(diferente, imagen);
%end


function v = param_vec(d, vent, ts)
    v=fft(d);
    v=fftshift(v);
    %v=log10(g);
    dw=1/(vent*ts);
    w=(-vent/2:vent/2-1)*dw;
    %plot(w,v)
    %sss=input('escriba algo');
    %http://www.sc.ehu.es/sbweb/energias-renovables/MATLAB/datos/fourier/fourier_1.html
end

function d = angulo_coseno(vi,vj)
    a=norm(vi);
    b=norm(vj);
    p=vi*vj';
    d=p/a/b;
end