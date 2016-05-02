%% B = espectro_ritmo (A) A partir de una matriz cuadrada
%% Obtiene un vector del tamaño de la diagonal que es
%%
%%     B(i)= sum S(k,k+l)
%%           kcR
%%
%%  B(0) es la suma de la diagonal principal
%%  B(1) es la suma de la primera superdiagonal
%%  ...
%%
%% ver "The beat spectrum: a new approach to rhythm analisis"
%% Jonathan Foote y Shingo Uchihashi

function B = espectro_ritmo(A)
    tam = size(A);
    B=zeros(1, tam(1));
    for i=0:tam(1)-1
        B(i+1)=suma_diagonal(A,i);
    end
end

function s = suma_diagonal(A,k)
    s=sum(diag(A,k));
end

%% Pruebas
%% si tiene un argumento
%% si el argumento es una matriz cuadrada
%% espectro_ritmo(1) -> 1
%% espectro_ritmo([1 1 1; 1 1 1; 1 1 1]) ->  [3 2 1]
%% espectro_ritmo([1 1 1; 1 1 1] -> error

