REPOS := user-service credit-data-service pep-service application-handler-service sms-service point-service mail-service message-dispatcher application-service integration-response-service partner-service tracking-service
ORG := LendoSTPGdansk
TARGET := src

default: run

init:
			@echo "[INFO] initialize integration environment"
			@if [ ! -f .env ] ; then \
				echo " ... making .env file. please adjust variables to your needs" ; \
				cp .env.example .env || true ; \
			fi


clone:
			@echo "[INFO] cloning repositories"
			@for r in $(REPOS) ; do git clone git@github.com:$(ORG)/$$r.git $(TARGET)/$$r ; done

run:
			@echo "[INFO] running containers"
			docker-compose up -d

clean:
			@echo "[INFO] killing containers"
			@docker-compose kill || true
			@echo "[INFO] removing containers"
			@docker-compose rm -fv || true

startup:
			@echo "[INFO] cloning repositories"
			@for r in $(REPOS) ; do docker exec -it $$r bash -c "sh bin/startup.sh" ; done

