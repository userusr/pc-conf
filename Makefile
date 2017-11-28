NAME = userusr/worksp
VERSION = 0.0.1

all: build

build:
	sudo docker build -t $(NAME):$(VERSION) --rm .

clean:
	sudo docker rmi $(NAME):$(VERSION)
