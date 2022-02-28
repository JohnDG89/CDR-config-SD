# CDR SMILE

Repositorio de configuración de las imagenes docker del CDR Salud Digital.

Se requiere disponer de un servidor con docker y docker-compose instalado.

### Configuración del ambiente servidor Centos 7

#### Instalación de Docker engine

```
#Instalar yum-utils package (quien provee la yum-config-manager) y setea un repositiorio estable.
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#Instalar la última versión de Docker Engine y containerd
sudo yum install docker-ce docker-ce-cli containerd.io

#Iniciar docker
sudo systemctl start docker

#Verificar que quedó correcto
sudo docker run hello-world
```

#### Instalación de docker compose

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version
```

### Instalación en servidores MINSAL

1. Mover imagen `smilecdr-2022.02.R01-docker.tar.gz` al servidor
2. `cd` a la ruta donde dejó la imagen anterior y cargar a docker: `docker image load --input="smilecdr-2022.02.R01-docker.tar.gz"`
3. Descargar este proyecto en el servidor
4. Crear archivo `.env` usando como base el archivo `.env-example`, ahí deberá setear la información de base de datos según el ambiente donde se esté desplegando. Dirígase al siguiente link para acceder a los .env de los ambientes [Manual Despliegue] (https://www.notion.so/Instalaci-n-SMILE-18a878df11394959928837a784c8e06e, "Manual Despliegue")
5. Remover imagenes, contenedores y volumenes que pudiesen estar cargados en docker: `docker-compose down --rmi all -v`
6. Posicionarse en la raíz donde se encuentra este proyecto en su servidor
7. Crear la imagen, el contenedor y correrlo en segundo plano: `docker-compose up --build -d`. Si desea correr viendo el log no ingrese el `-d`
8. Con eso deberá dirigirse a la ruta http://localhost:9100 y verá el login del aplicativo

### Proceso de creación de este proyecto

Este proyecto se configuró con tal de disponer de un docker-compose para el despligue del aplicativo en cualquier ambiente simplemente modificando las variables de entorno para la conexión de base de datos de cada ambiente.

Los pasos que se realizaron fueron los siguientes:

1. Se descargó la imagen oficial de SMILE CDR
2. Se cargó la imagen al docker engine local con el comando: `docker image load --input="smilecdr-2022.02.R01-docker.tar.gz"`
3. Se creó la carpeta del proyecto, y se extrajo el archivo de configuración de cluster con el comando: `docker cp smilecdr:/home/smile/smilecdr/classes ./`
4. Se editó el archivo `cdr-config-Master.properties` permitiendo que reciba las credenciales de base de datos mediante variables de entorno
5. Se generó archivo `Dockerfile` presente en el proyecto, el cual toma como base la imagen original de smilecdr y le copia el archivo de configuración modificado
6. Se generó el archivo `docker-compose.yml` que crea el contenedor smilecdr, da el comando build, genera los volumenes y setea las variables de entorno dentro del contenedor
7. Se generó archivo `.env-example` con tal de dejar en claro los nombres que deben tener las variables de entorno a crear en el archivo `.env` antes de ejecutar el comando de despliegue de docker-compose `docker-compose up --build -d`
