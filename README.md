
# Micolet NewLetter Landing

Landing para registrar suscriptores a una newsletter, el cliente ingresa su correo y preferencias y recibe un email de notificación.

Utiliza Abstract Api para validar el email y el smtp de gmail para el envio del email de notificación.

Estan habilitados los lenguajes en(deafult), es y fr accediendo por url. Ejemplo localhost:3000/es

## Como ejecutar el proyecto

1. Crea un archivo .env en base a el archivo .env.example

2. Configuracion de variables de entorno

ABSTRACTAPI_KEY: con una cuenta gratis en https://www.abstractapi.com/email-verification-validation-api se obtiene el api key 

Si se desea recibir emails usando GMAIL como servidor de correo es necesario ejecutar los siguientes pasos en un correo de gmail:

    1. Activar la verificacion de 2 pasos.
    2. En la misma pantalla luego de configurar la verificacion de dos pasos, crear una contraseña de aplicacion la cual será asignada a GMAIL_PASSWORD.

Si no se deseea recibir el correo se puede mantener estos datos en el .env
```
GMAIL_USERNAME=your_email@gmail.com
GMAIL_PASSWORD=your_password
```
3. Levantar el proyecto

 En la raiz de proyecto ejecutar
```
 docker-compose build
```
```
 docker-compose up
```
Ingresar a

```
 localhost:3000
```
## Test

```
docker-compose run --entrypoint="bin/rails test" test
```
