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
1. Mover imagen *smilecdr-2022.02.R01-docker.tar.gz* al servidor
2. `cd` a la ruta donde dejó la imagen anterior y cargar a docker: `docker image load --input="smilecdr-2022.02.R01-docker.tar.gz"`
3. Descargar el proyecto en el servidor a instalar el aplicativo
4. Remover imagenes, contenedores y volumenes que pudiesen estar cargados en docker `docker-compose down --rmi all -v`
5. Posicionarse en la raíz donde se encuentra este proyecto en su servidor
6. Crear la imagen, el contenedor y correrlo en segundo plano `docker-compose up --build -d`. Si desea correr viendo el log no ingrese el `-d`
7. Con eso deberá dirigirse a la ruta http://localhost:9100 y verá el login del aplicativo
