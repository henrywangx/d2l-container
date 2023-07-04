IMAGE ?= henrywangx/d2l
TAG ?= v1.0

build: 
	docker build -t $(IMAGE):$(TAG) .
push:
	docker push $(IMAGE):$(TAG)
run:
	docker run --rm -p 8888:8888 $(IMAGE):$(TAG)
