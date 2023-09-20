# Hello everyone!!!!

## Contenido

- [Parte 1: Jenkins (Puntuación total: 30 puntos)](#parte-1-jenkins-puntuación-total-30-puntos)
  - [1.1. Configuración de Jenkins:](#11-configuración-de-jenkins)
  - [1.2. Creación de un Pipeline:](#12-creación-de-un-pipeline)
- [Parte 2: Docker y Docker Compose (Puntuación total: 20 puntos)](#parte-2-docker-y-docker-compose-puntuación-total-20-puntos)
  - [2.1. Dockerización de una Aplicación:](#21-dockerización-de-una-aplicación)
  - [2.2. Orquestación de Contenedores con Docker Compose:](#22-orquestación-de-contenedores-con-docker-compose)



## Parte 1: Jenkins (Puntuación total: 30 puntos)
Toda la configuración debe estar montada en el PaaS que desees como por ejemplo Heroku.
### 1.1. Configuración de Jenkins:

- Instale Jenkins en un servidor Linux
- Configure Jenkins para ejecutarse en el puerto 8080.

#### Ejecuta un Contenedor Jenkins:

Abre una terminal en tu máquina local.
Ejecuta el siguiente comando para descargar y ejecutar un contenedor Docker de Jenkins en el puerto 8080:
```
docker run -d -p 8080:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```


[![Opera-Instant-nea-2023-09-07-130206-localhost.png](https://i.postimg.cc/sDw1QKj4/Opera-Instant-nea-2023-09-07-130206-localhost.png)](https://postimg.cc/svG3bYZM)

- Proporcione los pasos que seguiría para asegurar Jenkins con un usuario y
contraseña.

#### Accede a Jenkins:

Abre un navegador web y visita http://localhost:8080. Jenkins te pedirá una contraseña de desbloqueo que puedes obtener ejecutando el siguiente comando en tu terminal:

```
docker exec -it $(docker ps -q) cat /var/jenkins_home/secrets/initialAdminPassword
```

[![Opera-Instant-nea-2023-09-07-134108-localhost.png](https://i.postimg.cc/jdnZ2cJw/Opera-Instant-nea-2023-09-07-134108-localhost.png)](https://postimg.cc/HVHQPQzd)

[![Opera-Instant-nea-2023-09-07-135244-localhost.png](https://i.postimg.cc/52yVrZHY/Opera-Instant-nea-2023-09-07-135244-localhost.png)](https://postimg.cc/GHWV8gxd)

[![Opera-Instant-nea-2023-09-07-135255-localhost.png](https://i.postimg.cc/rmL7qbp9/Opera-Instant-nea-2023-09-07-135255-localhost.png)](https://postimg.cc/mc8mwmCc)

[![Opera-Instant-nea-2023-09-07-135304-localhost.png](https://i.postimg.cc/RFXd2bJh/Opera-Instant-nea-2023-09-07-135304-localhost.png)](https://postimg.cc/1nVDqBH1)

[![Opera-Instant-nea-2023-09-07-135908-localhost.png](https://i.postimg.cc/7ZNyfwpW/Opera-Instant-nea-2023-09-07-135908-localhost.png)](https://postimg.cc/xXqZZDjv)

### 1.2. Creación de un Pipeline:
- Cree un Jenkinsfile para un proyecto de prueba que clona un repositorio de Git y ejecuta una compilación simple (por ejemplo, un "Hello World" en un lenguaje de programación de su elección).

#### Paso 1: Inicia Jenkins Localmente
Asegúrate de que Jenkins esté instalado y funcionando localmente en tu máquina. Puedes acceder al panel de control de Jenkins a través de tu navegador web visitando http://localhost:8080 (u otra URL si has configurado un puerto diferente).

#### Paso 2: Configura Jenkins para Usar Git
Si aún no has configurado Git en Jenkins, necesitas hacerlo. Ve a "Administrar Jenkins" desde el panel de control.
Luego, ve a "Configurar el sistema" y busca la sección "Git". Asegúrate de que Git esté configurado y funcione correctamente en tu sistema. Guarda la configuración si es necesario.

#### Paso 3: Crea un Nuevo Job de Jenkins
Desde el panel de control de Jenkins, selecciona "Nueva tarea" o "Nuevo trabajo".
Dale un nombre a tu trabajo (por ejemplo, "Mi Pipeline de Prueba") y selecciona "Crear un proyecto de pipeline".

#### Paso 4: Configura el Pipeline
En la sección "Definición de pipeline", selecciona "Pipeline de DSL" y luego selecciona "Pipeline script from SCM" en el menú desplegable.
A continuación, configura la ubicación de tu repositorio Git. Ingresa la URL de tu repositorio en la sección "Repository URL".
En la sección "Script Path", ingresa la ubicación del Jenkinsfile en tu repositorio. Por lo general, es "Jenkinsfile" a menos que hayas configurado una ubicación diferente en tu repositorio.
En "Branch Specifier", ingresa la rama de Git que deseas construir. Por ejemplo, "master".
En "Lightweight checkout", asegúrate de que esté habilitado (marcado) para habilitar la clonación ligera del repositorio.
Puedes configurar otras opciones según tus necesidades.

#### Paso 5: Guarda la Configuración
Haz clic en "Guardar" o "Aplicar" para guardar la configuración del pipeline.

#### Paso 6: Ejecuta el Pipeline
De vuelta en el panel de control de Jenkins, busca tu trabajo (por ejemplo, "Mi Pipeline de Prueba") en la lista de trabajos disponibles.
Haz clic en el trabajo para abrirlo y luego selecciona "Ejecutar ahora" en el menú de la izquierda.
Jenkins ejecutará el pipeline, que clonará el repositorio de Git y ejecutará la compilación simple (en este caso, imprimir "Hello World").

#### Paso 7: Ver el Resultado
Una vez que se complete la ejecución del pipeline, podrás ver los resultados en la consola de Jenkins y en los registros de compilación.
Si todo se realiza correctamente, deberías ver el mensaje "La compilación fue exitosa" en los registros.


[![Opera-Instant-nea-2023-09-07-172623-localhost.png](https://i.postimg.cc/CLbsQBFB/Opera-Instant-nea-2023-09-07-172623-localhost.png)](https://postimg.cc/F7sSfKkN)

- Configure el pipeline para que se ejecute automáticamente cuando se realicen cambios en el repositorio de Git.
```
pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *') // Esto ejecutará el pipeline cada 5 minutos para verificar cambios en el repositorio
    }

    stages {
        stage('Clonar Repositorio') {
            steps {
                // Clonar el repositorio de Git con la credencial git_credentials
                checkout([$class: 'GitSCM', branches: [[name: 'master']], 
                          doGenerateSubmoduleConfigurations: false, extensions: [], 
                          submoduleCfg: [], userRemoteConfigs: [[credentialsId: "git_credentials", 
                          url: "https://github.com/dramax8569/prueba.git"]]])
            }
        }

        stage('Compilación') {
            steps {
                // Ejecutar aquí tus comandos de compilación
                sh 'echo "Hello World"'
                // Agrega aquí cualquier otro comando necesario para tu compilación
            }
        }
    }

    post {
        success {
            // Puedes agregar acciones posteriores a una compilación exitosa
            echo "La compilación fue exitosa"
        }
        failure {
            // Puedes agregar acciones posteriores a una compilación fallida
            echo "La compilación falló"
        }
    }
}
```


- Proporcione el código del Jenkinsfile y una descripción de cómo configuraría el webhook de Git.

#### Paso 1: Accede a la Configuración del Repositorio
Inicia sesión en tu cuenta de GitHub.
Ve al repositorio en el que deseas configurar el webhook.
En la parte superior del repositorio, haz clic en la pestaña "Configuración" (Settings).

#### Paso 2: Configura el Webhook
En el menú lateral izquierdo, selecciona "Webhooks".
Haz clic en el botón "Agregar webhook" o "Add webhook".

#### Paso 3: Configura la URL del Webhook
En el campo "Payload URL", debes ingresar la URL del webhook de Jenkins. La URL tendrá el formato http://tu_dominio_de_jenkins/github-webhook/.
Por ejemplo: http://mi-jenkins.com/github-webhook/

#### Paso 4: Configura el Tipo de Contenido
Para el campo "Content type", selecciona "application/json".

#### Paso 5: Configura los Eventos
En la sección "Which events would you like to trigger this webhook?", selecciona "Just the push event" si solo deseas que el webhook se active cuando se realicen envíos (pushes) al repositorio. Si deseas activar el webhook para otros eventos, puedes seleccionar eventos adicionales.

#### Paso 6: Configura la Seguridad del Webhook
Para la opción "Secret", puedes agregar un secreto compartido que permitirá a Jenkins verificar que las solicitudes provienen de GitHub. Este es un paso opcional pero recomendado para mayor seguridad.

#### Paso 7: Configura SSL
Si tu servidor Jenkins utiliza SSL (HTTPS), marca la casilla "Enable SSL verification" para que GitHub verifique el certificado SSL de tu servidor Jenkins. Esto es importante para garantizar la seguridad de las comunicaciones.

#### Paso 8: Agrega el Webhook
Haz clic en el botón "Add webhook" o "Agregar webhook" para guardar la configuración.

#### Paso 9: Prueba el Webhook
Para verificar que el webhook esté funcionando correctamente, puedes hacer clic en el webhook en la lista de webhooks y luego en "Deliveries". Esto te mostrará el historial de entregas del webhook y te permitirá verificar si hay solicitudes exitosas.


## Parte 2: Docker y Docker Compose (Puntuación total: 20 puntos)
### 2.1. Dockerización de una Aplicación:
- Cree un archivo Dockerfile para una aplicación web simple (por ejemplo, un servidor web).

[![imagen-2023-09-07-144732181.png](https://i.postimg.cc/3w62s4KM/imagen-2023-09-07-144732181.png)](https://postimg.cc/bGxGbvDL)

- Construya una imagen Docker de la aplicación.

[![Captura-de-pantalla-2023-09-07-144342.png](https://i.postimg.cc/CxS77qKm/Captura-de-pantalla-2023-09-07-144342.png)](https://postimg.cc/SJ1cNjCM)

[![Captura-de-pantalla-2023-09-07-144330.png](https://i.postimg.cc/jS7g3b6S/Captura-de-pantalla-2023-09-07-144330.png)](https://postimg.cc/qNpxgWZP)

- Proporcione el contenido del Dockerfile y los comandos utilizados para
construir la imagen.

Este Dockerfile se usa para construir una imagen de Docker para una aplicación Node.js. Aquí hay una breve descripción de lo que hace cada parte:

```FROM node:14 ``` : Esto indica que estamos utilizando la imagen oficial de Node.js versión 14 como base para nuestra imagen.

```WORKDIR /app ``` : Establece el directorio de trabajo dentro del contenedor en /app.

``` COPY package*.json ./ ``` : Copia los archivos package.json y package-lock.json (si existen) desde el directorio actual (donde se encuentra el Dockerfile) al directorio /app en el contenedor.

``` RUN npm install ``` : Instala las dependencias de la aplicación Node.js en el contenedor.

``` COPY . . ```: Copia todo el código de la aplicación desde el directorio actual al directorio /app en el contenedor.

``` EXPOSE 8080 ``` : Indica que la aplicación escuchará en el puerto 8080.

``` CMD ["node", "app.js"] ``` : Especifica el comando que se ejecutará cuando el contenedor se inicie. En este caso, estamos ejecutando node app.js, que sería el punto de entrada de nuestra aplicación Node.js.

<br>

### 2.2. Orquestación de Contenedores con Docker Compose:
- Escriba un archivo de configuración de Docker Compose que lance la aplicación web y una base de datos (por ejemplo, MySQL) en contenedores separados.

[![imagen-2023-09-07-151257064.png](https://i.postimg.cc/3RDhr6mS/imagen-2023-09-07-151257064.png)](https://postimg.cc/dkvp45Wr)

[![imagen-2023-09-07-151344059.png](https://i.postimg.cc/LsLvH3hk/imagen-2023-09-07-151344059.png)](https://postimg.cc/Y42QRg6j)

[![imagen-2023-09-07-151435091.png](https://i.postimg.cc/cLMr0K0g/imagen-2023-09-07-151435091.png)](https://postimg.cc/jD2shSWt)
- Describa cómo ejecutar los contenedores utilizando Docker Compose.

Asegúrate de que tengas un archivo llamado ```docker-compose.yml``` con el contenido anterior en el directorio deseado.

Abre una terminal y navega hasta el directorio donde se encuentra tu archivo ```docker-compose.yml```.

Ejecuta el siguiente comando para iniciar los contenedores:

```docker-compose up```

Esto iniciará los contenedores definidos en el archivo de Docker Compose.

Si deseas ejecutar los contenedores en segundo plano, puedes agregar la opción ```-d```:

```docker-compose up -d```

Tu aplicación web debería estar disponible en http://localhost:8080 (o en el puerto que hayas especificado) y debería poder conectarse a la base de datos MySQL utilizando el nombre del servicio database como host.

Para detener los contenedores, puedes ejecutar:
```docker-compose down```
