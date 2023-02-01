
Name_Service_DB="db"

#verificaçaõ se o serviço do Postgres esta rodando, se nao, iniciar
if [ -z `docker ps -q --no-trunc |  $(docker-compose ps -q $Name_Service_DB)` ]; then
  echo "No, it's not running."
  docker-compose up -d
else
  echo "Yes, it's running."
fi