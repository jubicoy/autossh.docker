SHELL := /bin/bash

all: container

container:
	docker build -t jubicoy/autossh .

push:
	docker push jubicoy/autossh
