IMAGE_NAME:=jecklgamis/etcd
IMAGE_TAG:=main
default:
	@cat ./Makefile
image:
	@docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
run:
	docker run --rm  -p 2379:2379  -it $(IMAGE_NAME):$(IMAGE_TAG)
run-shell:
	@docker run -i -t $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
exec-shell:
	@docker exec -it `docker ps | grep $(IMAGE_NAME) | awk '{print $$1}'` /bin/bash
all: image