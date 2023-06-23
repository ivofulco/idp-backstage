# Pre-req

install-curl-ubuntu:
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install curl -y
	clear
	curl --version

install-nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

#install-nvm:
#	npm install --global yarn \
#	yarn --version

install-docker:
	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh ./get-docker.sh --dry-run
	rm -rfv ./get-docker.sh

install-git:
	sudo apt-get update -y
	sudo apt-get install git-all
	git version

docker-postgresql:
	docker pull postgres;
	docker images;
	docker run -p 5432:5432 -v /home/${USER}/.docker/desktop/vms/0/data/postgresql:/var/lib/postgresql/data -e POSTGRES_PASSWORD=1234 -d postgres;
	docker ps
	sudo -i -u postgres


install-dbeaver:
	sudo snap install dbeaver-ce

# Clean up


#remove-postgres:
#    dpkg -l | grep postgres | sudo apt-get --purge remove -y
#    sudo apt autoremove -y

##### Step 1

Create-your-Backstage-App:
	npx @backstage/create-app@latest

backstage-install-backend:
	yarn add --cwd packages/backend pg

Run-the-Backstage-app:
#cd backstage | sudo chown -R ${USER} /.
	cd backstage; \
	yarn dev
#xdg-open http://localhost:3000

Build-Docker-Image:
	cd backstage; \
	yarn install --frozen-lockfile \
	yarn tsc \
	yarn build:backend --config app-config.yaml \
	docker image build . -f packages/backend/Dockerfile --tag backstage
#docker run -it -p 7007:7007 backstage

##############################

SECRET = 1234
ENCODE := $(shell echo "$(SECRET)" | base64 )

secret-encode:
	@echo "ORIGINAL VALUE: '$(SECRET)'"
	@echo "SECRET '$(SECRET)' ENCODE BASE64 = '$(ENCODE)'"