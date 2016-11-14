REPOS := user-service credit-data-service pep-service application-handler-service sms-service point-service mail-service message-dispatcher
ORG := LendoSTPGdansk
TARGET := src

default: clone run

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
			@docker-compose rm -f || true
