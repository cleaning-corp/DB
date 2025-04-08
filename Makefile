IMAGE_NAME=cleaning-db-image
CONTAINER_NAME=cleaning-db

.PHONY: all init build run stop clean rebuild

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run -d \
		--name $(CONTAINER_NAME) \
		--env-file .env \
		-p 5432:5432 \
		$(IMAGE_NAME)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

clean: stop
	docker image rm $(IMAGE_NAME) || true
