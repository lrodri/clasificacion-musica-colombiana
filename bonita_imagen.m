function bonita_imagen (imagen_ent, imagen_sal, t1, t2)

% ---------------------------------------------------------------------------------------
% Esta funcion permite acomodar la matriz de similitud dandole un giro de 90° a la imagen
% para tener una mejor visualizacion en cuanto a escala de tiempo entre t1 y t2 
% ---------------------------------------------------------------------------------------

ima=imread([imagen_ent '.png']);
ima1=fliplr(ima);

x=linspace(t1,t2,1000);
y=linspace(t1,t2,1000);
imagesc(x,y,ima1);
colormap(gray(256));

print([imagen_sal '-xy' '.png'], '-dpng'), title(imagen_sal);

end