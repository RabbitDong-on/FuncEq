run: build-image run-container

build-image:
	docker image build -t dg/funceq:0.1 .

run-container:
	docker run -it --privileged --name $(container_name)  dg/funceq:0.1


clean: rm-container rm-image

rm-container:
	docker container rm --force funceq

rm-image:
	docker image rm dg/funceq:0.1
