# CDR SMILE
Repositorio de configuración de las imagenes docker del CDR Salud Digital.

Se requiere disponer de un servidor con docker y docker-compose instalado.

### Instalación en servidores MINSAL
1. Descargar el proyecto en el servidor a instalar el aplicativo
2. Remover imagenes, contenedores y volumenes que pudiesen estar cargados en docker `docker-compose down --rmi all -v`
3. Posicionarse en la raíz donde se encuentra este proyecto en su servidor
4. Construir la nueva imagen modificada `docker-compose build`
5. Crear la imagen, el contenedor y correrlo en segundo plano `docker-compose up --build -d`
6. Con eso deberá dirigirse a la ruta http://localhost:9100 y verá el login del aplicativo
