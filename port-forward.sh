#!/usr/bin/env bash

MY_IP=$(terragrunt output --terragrunt-working-dir ./terragrunt/ai/server ipv4 | xargs)
#ssh-keygen -R "$MY_IP"
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -L 8080:127.0.0.1:8080  "devops@$MY_IP"
