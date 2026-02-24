#!/bin/bash

# Инициализация шардов

docker compose exec -T shard1_1 mongosh --port 27018 <<EOF
rs.initiate(
    {
      _id : "rs1",
      members: [
        { _id : 0, host : "shard1_1:27018" },
        { _id : 1, host : "shard1_2:27018" },
        { _id : 2, host : "shard1_3:27018" }
      ]
    }
);
exit();
EOF

docker compose exec -T shard2_1 mongosh --port 27018 <<EOF
rs.initiate(
    {
      _id : "rs2",
      members: [
        { _id : 0, host : "shard2_1:27018" },
        { _id : 1, host : "shard2_2:27018" },
        { _id : 2, host : "shard2_3:27018" }
      ]
    }
  );
exit();
EOF
