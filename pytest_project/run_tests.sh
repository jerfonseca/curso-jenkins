#!/bin/bash

echo "========== DEBUG JENKINS =========="
echo "Script: $(realpath "$0")"
echo "Directorio: $(pwd)"
echo "Usuario: $(whoami)"
echo "Python:"
which python3
python3 --version

echo "Contenido del workspace:"
ls -la

echo "Contenido de venv:"
ls -la venv 2>/dev/null || echo "venv NO EXISTE"

echo "==================================="

echo "Iniciando ejecución de pruebas en jenkins..."

if [ ! -f "venv/bin/python" ]; then
    echo "Entorno virtual no encontrado o incompleto. Creando entorno virtual..."
    rm -rf venv
    python3 -m venv venv
fi

echo "Activando el entorno virtual..."
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then # Para Windows
    source venv/Scripts/activate
else
    echo "Error: No se pudo activar el entorno virtual. Asegúrate de que 'venv' exista."
    exit 1
fi

echo "Instalando dependencias..."
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

echo "Ejecutando pruebas con pytest..."
venv/bin/python -m pytest tests/ --junitxml=reports/test_results.xml --html=reports/test_report.html --self-contained-html

echo "Pruebas completadas. Los resultados se han guardado en reports/test_results.xml y reports/test_report.html"