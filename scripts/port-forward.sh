#!/usr/bin/env bash

MY_IP=$(terragrunt output --terragrunt-working-dir ./terragrunt/ai/server ipv4 | xargs)
echo "webui: http://localhost:8080"
ssh -N -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -L 8080:127.0.0.1:8080  "devops@$MY_IP"
