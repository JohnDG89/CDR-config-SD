# CDR SMILE
Repositorio de configuración de las imagenes docker del CDR Salud Digital.

Se requiere disponer de un servidor con docker y docker-compose instalado.

### Configuración del ambiente servidor Centos 7
Si no dispone de docker, deberá instalarlo siguiendo los siguiente comandos:
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


### Instalación en servidores MINSAL
1. Descargar el proyecto en el servidor a instalar el aplicativo
2. Remover imagenes, contenedores y volumenes que pudiesen estar cargados en docker `docker-compose down --rmi all -v`
3. Posicionarse en la raíz donde se encuentra este proyecto en su servidor
4. Crear la imagen, el contenedor y correrlo en segundo plano `docker-compose up --build -d`. Si desea correr viendo el log no ingrese el `-d`
5. Con eso deberá dirigirse a la ruta http://localhost:9100 y verá el login del aplicativo
