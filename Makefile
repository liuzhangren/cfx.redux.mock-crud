pjName := redux

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-p 3333:3000 \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash

in:
	docker exec \
		-ti \
		${pjName} \
		/bin/bash

deploy:
	docker run -d \
		--name ${pjName} \
		--restart=always \
		-p 3030:3000 \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash -lc "cd /root/${pjName}; yarn rebuild; yarn start"

link:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-p 3030:3000 \
		--link Platform_BE_user.micro \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash
