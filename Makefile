test:
	ls

logs:
	docker-compose logs

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

exec-nuxt:
	docker-compose exec --user local nodejs /bin/sh

root-nuxt:
	docker-compose exec nodejs /bin/sh

root:
	docker-compose exec php_fpm /bin/sh

ps:
	docker-compose ps

rm:
	docker rm $(docker ps -aq)

rmi:
	docker rmi -f $(docker images -q)

