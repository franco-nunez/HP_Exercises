# HP Filter Exercises - Ejercicios con el filtro HP

[ES] En este repositorio se encuentran los códigos y archivos necesarios para reproducir los ejercicios con el filtro HP. Se utilizan los paquetes extrafont (v0.17), ggplot2 (v3.3.2),  zoo (v1.8-8), writexl (v1.3.1), tsbox (v0.2.1), readxl (v1.3.1) y mFilter (v0.1-5).

Se repiten los mismos pasos para el logaritmo del PBI real de Estados Unidos y Chile (multiplicados por 100 para tener interpretación en puntos porcentuales). En ambos casos, luego de descargar la carpeta correspondiente ("US" o "Chile") para replicar el ejercicio solo hay que ejecutar el código "4 - Visualization.R". Los archivos necesarios estan en la carpeta "Inputs". Además, los otros códigos se van ejecutando automáticamente: los "3 - Visualization LT.R" y "3 - Visualization ST.R" generan los gráficos, para lo que llaman a los que realizan la estimación, que comienzan con 2. A su vez, estos llaman a los códigos de procesamiento primario de datos, que comienzan con con 1.

Tanto los archivos como las imágenes con los gráficos se generarán en la carpeta "Outputs". Al descargarse esta carpeta ya viene con archivos, pero solo a modo de comparación o control. Al ejecutar el código se reemplzarán (aunque los resultados serán los mismos).
