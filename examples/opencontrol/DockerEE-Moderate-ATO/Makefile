.PHONY: opencontrols exports

default: serve

clean:
	docker rmi -f dockereemoderatessp:17.06

build:
	docker build -t dockereemoderatessp:17.06 .

serve: build
	docker run --rm -it -p 4000:4000 dockereemoderatessp:17.06
