# .SILENT:
MAKEFLAGS += --silent

help:
	echo
	echo "2. Year Project"
	echo
	echo "	help - Show this message"
	echo "	clean - Remove docker containers"
	echo "	build - build docker images"
	echo "	run - Start app locally"
	echo "	test - Run test locally"
	echo "	deploy - Deploy app to server and run it"
	echo "	deps - List project dependencies"
	echo

build: clean
	docker build -t nixen97/2yp:base -f ./base.Dockerfile .
	docker build -t nixen97/2yp:app -f ./app/Dockerfile ./app

build-test: build
	docker build -t nixen97/2yp:test -f ./test/Dockerfile ./test

run: build
	docker-compose -f ./run.yml up

test: build-test
	docker-compose -f ./test.yml up

clean:
	docker-compose -f ./run.yml rm -f

deploy:
	echo "deploy is not implemented yet"

deps:
	echo "	Dependencies "
	echo
	echo "		docker $(shell which docker > /dev/null || echo -e '\e[5m\e[107m\e[31m NOT INSTALLED \e[0m')"
	echo "		docker-compose $(shell which docker-compose > /dev/null || echo -e '\e[5m\e[107m\e[31m NOT INSTALLED \e[0m')"
	echo

.PHONY: build build-test run test clean deploy deps