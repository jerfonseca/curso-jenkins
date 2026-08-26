#!/bin/bash

echo "Activando el entorno virtual..."
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv
fi
source venv/bin/activate

echo "Instalando dependencias..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Ejecutando pruebas con pytest..."
pytest tests/ --junitxml=reports/test_results.xml --html=reports/test_report.html --self-contained-html

echo "Pruebas completadas. Los resultados se han guardado en reports/test_results.xml y reports/test_report.html"