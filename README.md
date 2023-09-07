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

[![Opera-Instant-nea-2023-09-07-134145-localhost.png](https://i.postimg.cc/SQ3HgJ69/Opera-Instant-nea-2023-09-07-134145-localhost.png)](https://postimg.cc/c67DH151)

[![Opera-Instant-nea-2023-09-07-135244-localhost.png](https://i.postimg.cc/52yVrZHY/Opera-Instant-nea-2023-09-07-135244-localhost.png)](https://postimg.cc/GHWV8gxd)

[![Opera-Instant-nea-2023-09-07-135244-localhost.png](https://i.postimg.cc/52yVrZHY/Opera-Instant-nea-2023-09-07-135244-localhost.png)](https://postimg.cc/GHWV8gxd)

[![Opera-Instant-nea-2023-09-07-135304-localhost.png](https://i.postimg.cc/RFXd2bJh/Opera-Instant-nea-2023-09-07-135304-localhost.png)](https://postimg.cc/1nVDqBH1)

### 1.2. Creación de un Pipeline:
- Cree un Jenkinsfile para un proyecto de prueba que clona un repositorio de Git y ejecuta una compilación simple (por ejemplo, un "Hello World" en un lenguaje de programación de su elección).
- Configure el pipeline para que se ejecute automáticamente cuando se realicen cambios en el repositorio de Git.
- Proporcione el código del Jenkinsfile y una descripción de cómo configuraría el webhook de Git.

