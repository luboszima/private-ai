
dependencies:
	bash scripts/dependencies.sh

asdf-update-tools:
	bash scripts/update_tools.sh

asdf-latest:
	asdf latest --all

asdf-update-plugins:
	asdf plugin update --all

tf-docs:
	terraform-docs -c .terraform-docs.yml --recursive terragrunt

tf-fmt:
	terraform fmt -recursive terragrunt/modules

tg-hclfmt:
	terragrunt hclfmt --terragrunt-working-dir ./terragrunt

tg-remove-cache:
	find . -type d -name ".terragrunt-cache" -exec rm -fr {} \; > /dev/null 2>&1

tg-init:
	yes | terragrunt run-all init -reconfigure --terragrunt-working-dir ./terragrunt/ai/server

tg-apply:
	yes | terragrunt run-all apply --terragrunt-working-dir ./terragrunt/ai/server

tg-destroy:
	yes | terragrunt run-all destroy --terragrunt-working-dir ./terragrunt/ai/server

pre-commit:
	pre-commit run -a -v

ssh:
	MY_IP=$(shell terragrunt output --terragrunt-working-dir ./terragrunt/ai/server ipv4 | xargs); \
	 ssh-keygen -R "$$MY_IP"; ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$$MY_IP

tg-init:
	yes | terragrunt run-all init -reconfigure --terragrunt-working-dir ./terragrunt/ai/server

tg-apply:
	yes | terragrunt run-all apply --terragrunt-working-dir ./terragrunt/ai/server

tg-destroy:
	yes | terragrunt run-all destroy --terragrunt-working-dir ./terragrunt/ai/server

ssh:
	MY_IP=$(shell terragrunt output --terragrunt-working-dir ./terragrunt/ai/server ipv4 | xargs); \
	 ssh-keygen -R "$$MY_IP"; ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@$$MY_IP
