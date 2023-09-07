# Use an official Node.js runtime as a parent image
FROM node:14

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Copiar el archivo package.json y package-lock.json (si está presente)
COPY package*.json ./

# Instalar las dependencias de la aplicación
RUN npm install

# Copiar el código de la aplicación al contenedor
COPY . .

# Exponer el puerto en el que se ejecuta la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["node", "app.js"]
