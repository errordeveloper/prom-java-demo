all: build local

local: 
	docker run -ti -p 8080:8080 errordeveloper/prom-java-demo:latest

build:
	docker build -t errordeveloper/prom-java-demo .

deps-cache:
	mvn dependency:go-offline
	mkdir deps-cache
	cp -a ~/.m2 deps-cache/repo
	printf "FROM maven:3.5-jdk-8-alpine\nCOPY repo /root/.m2\n" > deps-cache/Dockerfile
	docker build -t errordeveloper/prom-java-demo-deps deps-cache
	docker push errordeveloper/prom-java-demo-deps
	rm -rf deps-cache
