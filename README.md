# Canvasdata.downloadeR

Proceso de descarga y pre procesamiento de datos de Canvas


## Requerimientos revios.

1. Instalar node.js para poder utilizar lenguaje javascript.   ``` https://nodejs.org/dist/v16.14.0/node-v16.14.0-x64.msi```
2. Instalar CanvasDataCLI, para interactuar con la API.
  Para ello, ejecutar en la consola de R ```shell('npm install -g canvas-data-cli')```
3. Configurar credenciales API Canvas.  
  En ```config.js``` reemplazar 'your_canvas_api_key' y 'your_canvas_api_secret' por credenciales de la API de Canvas.
4. Instalar paquetes necesarios en R:  
-tidyverse  

```{r}
install.packages("tidyverse")
```

## Scripts.

### data_downloading

Consta de tres partes: 
1. Funciones ```unlink``` eliminan datos previos, para evitar que la actualización duplique la informació.
2. Funciones ```fetch``` descargan desde la api de Canvas los archivos comprimidos.
3. Funciones ```unpack``` descomprimen los archivos de acuerdo al esquema de datos.


### import_data

Importa los datos hacia el entorno de R. Depende del packete ```readr``` de tidyverse. Tiene configurado el tipo de variable al que corresponde cada columna.

### enrolling

Relaciona los estudiantes con los cursos que tienen inscritos.

### resume

Realiza el pre procesamiento de los quizzes. Por una parte, organiza los quizzes de acuerdo al orden de publicación dentro de la asignatura. Por la otra, crea un resumen de la participación y resultados de los estudiantes en cada asignatura, y los lleva al dataframe ```data_est```, donde están relacionados los estudiantes a cursos.
