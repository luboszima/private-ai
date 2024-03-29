#!/usr/bin/env bash

MY_IP=$(terragrunt output --terragrunt-working-dir ./terragrunt/ai/server ipv4 | xargs)
ssh-keygen -R "$MY_IP"
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "devops@$MY_IP"
