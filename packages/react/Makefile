#
pjName := cfx.react-redux

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash

deps:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-v $$(pwd):/root/${pjName} \
		--link cfx.registry \
		--link download.cfx.registry \
		mooxe/node \
		/bin/bash
