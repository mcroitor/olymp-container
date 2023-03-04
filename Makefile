# CACHE=--no-cache
CACHE=

build:
	@echo "build project images" ; \
	docker-compose --file docker-compose.yml build ${CACHE}; \
	echo "done"

up:
	@echo "up project" ; \
	docker-compose -f docker-compose.yml up -d ; \
	echo "project is up. access http://localhost"

rebuild: down build up

down:
	@echo "down project" ; \
	docker-compose -f docker-compose.yml down --remove-orphans; \
	echo "project is down"

stop:
	@echo "stop containers" ; \
	docker-compose -f docker-compose.yml stop; \
	echo "done"

mariadb:
	@echo "build mariadb image"; \
	docker-compose --file docker-compose.yml build ${CACHE} mariadb; \
	echo "done"

php-fpm:
	@echo "build php-fpm image"; \
	docker-compose --file docker-compose.yml build ${CACHE} php-fpm; \
	echo "done"

sandbox:
	@echo "build sandbox image"; \
	docker-compose --file docker-compose.yml build ${CACHE} sandbox; \
	echo "done"

nginx:
	@echo "build nginx image"; \
	docker-compose --file docker-compose.yml build ${CACHE} nginx; \
	echo "done"