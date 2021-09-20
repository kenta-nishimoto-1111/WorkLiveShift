cd trapla
git pull
docker-compose stop
docker-compose run web bundle install
docker-compose run web rails db:migrate
docker-compose run web rails assets:precompile
docker-compose up -d
