#!/bin/bash

# Verificar que terraform está instalado
if ! command -v terraform &> /dev/null; then
    echo "Error: Terraform no está instalado"
    exit 1
fi

# Verificar que las credenciales de AWS están configuradas
if ! aws sts get-caller-identity &> /dev/null; then
    echo "Error: Credenciales de AWS no configuradas"
    exit 1
fi

# Verificar que existe el directorio src con el juego
if [ ! -d "src" ]; then
    echo "Error: No se encuentra el directorio 'src' con los archivos del juego"
    exit 1
fi

echo "Iniciando despliegue..."

# Inicializa Terraform
terraform init

# Aplicar la configuración
terraform apply -auto-approve

# Mostrar la IP pública
echo "Esperando 30 segundos para que la instancia se inicialice..."
sleep 30
echo "La aplicación estará disponible en:"
terraform output instance_public_ip