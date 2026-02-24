init: compose-up init-config-srv init-shards init-mongos init-mongo

compose-up:
	docker compose up -d
	sleep 5

init-config-srv:
	$(CURDIR)/scripts/1-configsrv-init.sh

init-shards:
	$(CURDIR)/scripts/2-shards-init.sh

init-mongos:
	$(CURDIR)/scripts/3-mongos-init.sh

init-mongo:
	$(CURDIR)/scripts/4-mongo-init.sh

mongo-test:
	 docker compose exec -T shard1_1 mongosh --port 27018 somedb \
		--eval "db.helloDoc.countDocuments();"

	docker compose exec -T shard2_1 mongosh --port 27018 somedb \
        --eval "db.helloDoc.countDocuments();"


