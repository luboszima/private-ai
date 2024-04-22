#!/usr/bin/env bash

MY_IP=$(terragrunt output --terragrunt-working-dir ./terragrunt/ai/server ipv4 | xargs)
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null "devops@$MY_IP" docker restart webui 2>/dev/null
echo "restarted webui on $MY_IP"
