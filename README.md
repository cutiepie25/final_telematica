# 2048
Un pequeño clon de [1024](https://play.google.com/store/apps/details?id=com.veewo.a1024), basado en [2048 de Saming](http://saming.fr/p/2048/) (también un clon).

Hecho solo por diversión. [¡Juégalo aquí!](http://gabrielecirulli.github.io/2048/)

La aplicación oficial también se puede encontrar en [Play Store](https://play.google.com/store/apps/details?id=com.gabrielecirulli.app2048) y [App Store!](https://itunes.apple.com/us/app/2048-by-gabriele-cirulli/id868076805)

## Guía de Despliegue

### Requisitos Previos
- Cuenta AWS con credenciales configuradas
- Terraform (versión >= 1.9.8)
- Docker instalado localmente (para desarrollo)

### Pasos para el Despliegue
1. Clonar este repositorio
2. Asegurarse de que las credenciales de AWS estén correctamente configuradas
3. Navegar al directorio raíz del proyecto
4. Ejecutar el script de despliegue:
```bash
./deploy.sh
```

El proceso de despliegue:
- Verificará todos los requisitos previos
- Inicializará Terraform
- Creará la infraestructura necesaria en AWS:
  - Grupo de seguridad para SSH y HTTP
  - Instancia EC2 con Docker
  - Despliegue automatizado del contenedor
- Después de aproximadamente 30 segundos, mostrará la IP pública donde el juego estará accesible

### Detalles de la Infraestructura
El despliegue crea:
- Instancia EC2 t2.micro
- Grupo de seguridad con puertos 22 (SSH) y 80 (HTTP) abiertos
- Contenedor Docker ejecutando el juego

## Guía de Desarrollo

### Configuración del Entorno Local
1. Clonar el repositorio
2. Instalar dependencias:
   - Ruby (para compilación SASS)
   - Gema SASS (`gem install sass`)

### Estructura del Proyecto
```
src/
├── js/               # Archivos fuente JavaScript
├── style/           # Archivos SCSS y CSS
├── meta/            # Activos meta
└── index.html       # Archivo HTML principal
```

### Flujo de Desarrollo
1. Realizar cambios en una nueva rama desde `master`
2. Para cambios en CSS:
   - Editar archivos en `style/*.scss`
   - Ejecutar el observador de SASS:
     ```bash
     sass --unix-newlines --watch style/main.scss
     ```
3. Probar exhaustivamente
4. Enviar PR a la rama `master`

### Contribuciones

[Anna Harren](https://github.com/iirelu/) y [sigod](https://github.com/sigod) son los mantenedores de este repositorio.