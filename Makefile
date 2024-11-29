# docker-compose down
# docker-compose build
# docker-compose up -d

NAME = Inception

all: build

build:
	@docker-compose -f srcs/docker-compose.yml build

up:
	@docker-compose -f srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down

re: down build up