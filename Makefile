REGISTRY:= registry.techsytes.com
CONTAINER_NAME:= $(APP_NAME)
FULL_NAME:= $(REGISTRY)/$(CONTAINER_NAME)
TIMESTAMP:= `date +%Y`-`date +%m`-`date +%d`-`date +%s`
USER:= $$(git config user.name)

.PHONY: all info release-dev

all: info build

ifndef VERSION
$(error Atenção: Variavel "VERSION" não está definida.)
endif
ifndef APP_NAME
$(error Atenção: Variavel "APP_NAME" não está definida.)
endif


info:
	@env
	@echo "USER $(USER)"
	@echo "CONTAINER_NAME $(CONTAINER_NAME)"
	@echo "REGISTRY $(REGISTRY)"
	@echo "VERSION $(VERSION)"
	@echo "FULL_NAME: $(FULL_NAME)"
	@echo "TIMESTAMP $(TIMESTAMP)"

build:
	docker build -t ${FULL_NAME}:latest -t ${FULL_NAME}:${BUILD_NUMBER} .

push:
	docker push ${FULL_NAME}:latest
	docker push ${FULL_NAME}:${BUILD_NUMBER}
