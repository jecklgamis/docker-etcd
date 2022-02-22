IMAGE_NAME:=jecklgamis/etcd
IMAGE_TAG:=latest
default:
	@cat ./Makefile
image:
	@docker build -t $(IMAGE_NAME):$(IMAGE_TAG) -t $(IMAGE_NAME):latest .
run:
	docker run --rm  -p 2379:2379  -it $(IMAGE_NAME):$(IMAGE_TAG)
run-bash:
	@docker run -i -t $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
login:
	@docker exec -it `docker ps | grep $(IMAGE_NAME) | awk '{print $$1}'` /bin/bash
