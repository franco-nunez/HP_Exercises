# HP Filter Exercises - Ejercicios con el filtro HP

[ES] - [EN] 

[ES] En este repositorio se encuentran los códigos y archivos necesarios para reproducir los ejercicios con el filtro HP. En el archivo "Anexo - Gráficos - Ejercicios_con_el_filtro_HP.pdf" se encuentran todos los gráficos generados en el proceso (datos trimestrales y anuales, de ciclo y tendencia). Se utilizan los paquetes extrafont (v0.17), ggplot2 (v3.3.2),  zoo (v1.8-8), writexl (v1.3.1), tsbox (v0.2.1), readxl (v1.3.1) y mFilter (v0.1-5).

Se repiten los mismos pasos para el logaritmo del PBI real de Estados Unidos y Chile (multiplicados por 100 para tener interpretación en puntos porcentuales). En ambos casos, luego de descargar la carpeta correspondiente ("US" o "Chile") para replicar el ejercicio solo hay que ejecutar el código "4 - Visualization.R". Los archivos necesarios estan en la carpeta "Inputs". Además, los otros códigos se van ejecutando automáticamente: los "3 - Visualization LT.R" y "3 - Visualization ST.R" generan los gráficos, para lo que llaman a los que realizan la estimación, que comienzan con 2. A su vez, estos llaman a los códigos de procesamiento primario de datos, que comienzan con con 1. El código "Auxiliary - graphs.R" es ejecutado, pues tiene dos funciones para establecer el formato.

Tanto los archivos como las imágenes con los gráficos se generarán en la carpeta "Outputs". Al descargarse esta carpeta ya viene con archivos, pero solo a modo de comparación o control. Al ejecutar el código se reemplazarán (aunque los resultados serán los mismos).

[EN] In this repository you will find the codes and files necessary to reproduce the exercises with the HP filter. In the file "Annex - Graphics - Exercises_with_the_HP_Filter.pdf" you will find all the graphics generated in the process (quarterly and annual data, cycle and trend). The extrafont (v0.17), ggplot2 (v3.3.2), zoo (v1.8-8), writexl (v1.3.1), tsbox (v0.2.1), readxl (v1.3.1) and mFilter ( v0.1-5) packages are utilized.

The same steps are repeated for the logarithm of the real GDP of the United States and Chile (multiplied by 100 in order to have an interpretation in percentage points). In both cases, after downloading the corresponding folder ("US" or "Chile") to replicate the exercise, just execute the code "4 - Visualization.R". The files needed are in the "Inputs" folder. In addition, the other codes are automatically executed: the "3 - Visualization LT.R" and "3 - Visualization ST.R" generate the graphs, for which they call the estimators, which start with 2. At their Once, they call the primary data processing codes, starting with 1. The "Auxiliary - graphs.R" code is executed, as it has two functions to set the format.

Both the files and the images with the graphics will be generated in the "Outputs" folder. When this folder is downloaded, it already comes with files, but only for comparison or control. When executing the code they will be replaced (although the results will be the same). 



