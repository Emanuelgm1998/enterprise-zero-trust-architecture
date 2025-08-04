#!/bin/bash
echo -e "🔍 Verificando estructura, dependencias y ejecución del API...\n"

# Mostrar estructura del proyecto
tree -L 3

# Navegar a backend solo si existe
if [ -d "backend" ]; then
  cd backend
  echo -e "\n📦 Instalando dependencias...\n"
  npm install --silent

  echo -e "\n�� Ejecutando servidor en segundo plano...\n"
  node api/server.js &
  SERVER_PID=$!
  sleep 3

  echo -e "\n🔎 Verificando respuesta del API en http://localhost:3000 ...\n"
  RESPONSE=$(curl -s http://localhost:3000)
  
  # Validar si responde como se espera
  if [[ $RESPONSE == *"Enterprise Zero Trust API"* ]]; then
    echo -e "\n✅ Todo funcionando correctamente: estructura, dependencias y ejecución segura del backend.\n"
  else
    echo -e "\n❌ El servidor no respondió correctamente. Revisa api/server.js o los puertos.\n"
  fi

  kill $SERVER_PID
else
  echo -e "\n❌ La carpeta 'backend' no existe en esta ruta. Verifica que estés en el directorio correcto.\n"
fi
