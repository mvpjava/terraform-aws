#!/bin/bash -xe

#terraform apply -var "server_port=80"

terraform apply

public_ip=$(terraform output -raw public_ip)

sleep 30

curl http://$public_ip