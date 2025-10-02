#!/bin/bash -xe

#terraform init
#terraform plan

terraform apply -var "server_port=80"

public_ip=$(terraform output -raw public_ip)

curl http://$public_ip