this is a PRUEBA TÉCNICA DEVOPS ENGINEER

# Hello everyone!!!!

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

[![Opera-Instant-nea-2023-09-07-172623-localhost.png](https://i.postimg.cc/CLbsQBFB/Opera-Instant-nea-2023-09-07-172623-localhost.png)](https://postimg.cc/F7sSfKkN)

- Configure el pipeline para que se ejecute automáticamente cuando se realicen cambios en el repositorio de Git.

- Proporcione el código del Jenkinsfile y una descripción de cómo configuraría el webhook de Git.


## Parte 2: Docker y Docker Compose (Puntuación total: 20 puntos)
### 2.1. Dockerización de una Aplicación:
- Cree un archivo Dockerfile para una aplicación web simple (por ejemplo, un servidor web).
- Construya una imagen Docker de la aplicación.

[![Captura-de-pantalla-2023-09-07-144342.png](https://i.postimg.cc/CxS77qKm/Captura-de-pantalla-2023-09-07-144342.png)](https://postimg.cc/SJ1cNjCM)

[![Captura-de-pantalla-2023-09-07-144330.png](https://i.postimg.cc/jS7g3b6S/Captura-de-pantalla-2023-09-07-144330.png)](https://postimg.cc/qNpxgWZP)

- Proporcione el contenido del Dockerfile y los comandos utilizados para
construir la imagen.

[![imagen-2023-09-07-144732181.png](https://i.postimg.cc/3w62s4KM/imagen-2023-09-07-144732181.png)](https://postimg.cc/bGxGbvDL)

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
