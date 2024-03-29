#!/usr/bin/env bash

MY_IP=$(terragrunt output --terragrunt-working-dir ./terragrunt/ai/server ipv4 | xargs)
ssh-keygen -R "$MY_IP"
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "devops@$MY_IP"


# cycle through a list of items
echo "llama2-uncensored, llama2:13b" | sed 's/,/\n/g' | xargs -I {} echo "{}" | while read -r item; do
    echo "item: $item"
done
