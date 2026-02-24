#!/bin/bash

# Инициализация mongos

docker compose exec -T mongos_router mongosh --port 27017 <<EOF

sh.addShard( "rs1/shard1_1:27018,shard1_2:27018,shard1_3:27018");
sh.addShard( "rs2/shard2_1:27018,shard2_2:27018,shard2_3:27018");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

exit();
EOF
