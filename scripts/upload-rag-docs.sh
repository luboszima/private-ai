#!/usr/bin/env bash

 MY_IP=$(terragrunt output --terragrunt-working-dir ./terragrunt/ai/server ipv4 | xargs)
 scp  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -r ./RAG-docs devops@$MY_IP:/home/devops/data/docs  2>/dev/null
