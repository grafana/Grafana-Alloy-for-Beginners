.PHONY: run
run:
	docker compose up --build -d

.PHONY: stop
stop:
	docker compose down