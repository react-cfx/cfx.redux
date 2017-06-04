#
pjName := cfx.redux

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash

build:
	mkdir -p ./dest
	coffee -pbc src/index.coffee > ./dest/index.es6
	cat ./dest/index.es6 | babel --presets env > ./dest/index.js

clean:
	rm -rf ./dest

test: clean build
	coffee test/index.coffee
