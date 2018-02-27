pjName := cfx.redux

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash

in:
	docker exec \
		-ti	\
		${pjName} \
		/bin/bash
