SHELL := /bin/bash

.PHONY: gate test lint analyse hook routes migrate-pretend smoke dev-up dev-down regen-docs

gate:
	./scripts/quality-gate.sh

test:
	composer test

lint:
	composer lint

analyse:
	composer analyse

hook:
	composer install-hooks

routes:
	php artisan route:list

migrate-pretend:
	php artisan migrate --pretend

smoke:
	./scripts/smoke-test.sh

dev-up:
	./scripts/dev-up.sh

dev-down:
	./scripts/dev-down.sh

regen-docs:
	./scripts/regenerate-docs.sh v1
