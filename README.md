# private-ai
private AI runnning on Hetzner Infra

## prequisites
- [Hetzner](https://hetzner.cloud/?ref=UTExFIi8vytX) account
- asdf
- terraform

## setup

Install dependencies
```bash
task dependencies
```
note: script [dependencies.sh](scripts%2Fdependencies.sh) was originally written for macos, you might need to adjust it for your system

Create a new project in the Hetzner Cloud Console and create an API token.
Maybe you'll need new project: [https://console.hetzner.cloud/projects](https://console.hetzner.cloud/projects?ref=UTExFIi8vytX), and in project go to Security->API Tokens and create new token.

Create new .env.yaml file used by terragrunt.
```bash
cp .env.yaml.example .env.yaml
```
and change values of hetzner token and your pub ssh key.
```yaml
secrets:
  hetzner: "token"
  pub_ssh_key: "ssh key token"
```
also you can set which models you want pull and run on the server. Change this lines in .env.yaml file. All models can be found at ollama library: https://ollama.com/library
```yaml
ai:
  models: "llama2-uncensored, llama2:13b"
```
1. Then you can run terragrunt init
```bash
task tg-init
```
2. and Terragrunt apply
```bash
task tg-apply
```

This should create a server at hetzner cloud and install all necessary software on it.

After that you can run locally command to port-forward port from webui from remote server to your local machine:
```bash
task webui
```
After that you can open in your browser: [http://localhost:8080](http://localhost:8080)

If you want upload some of yours files to web ui, you can use this command:
```bash
task upload
```
This command will upload files from `./RAG-docs` directory to the server /home/devops/data/docs, and WebUI will use it to browse your data and answer questions related to this documents.

## BE CAREFUL
This is just a simple example of how to run private AI on Hetzner Cloud. It's not production ready and should be used only for educational purposes.

Also don't forget destroy your infrastructure after you finish your work, because server which we using is not free and you will be charged for it. CPX51 which we are using cost 65USD per month, better to use it temporarily and destroy it after you finish your work.
```bash
task tg-destroy
```
