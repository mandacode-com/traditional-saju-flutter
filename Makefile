include .env.make

.PHONY: run
run:
	fvm flutter run --flavor ${FLAVOR} -t lib/main_${FLAVOR}.dart --dart-define-from-file .env.${FLAVOR}

.PHONY: run-development
run-dev:
	fvm flutter run --flavor development -t lib/main_development.dart --dart-define-from-file .env.development

.PHONY: build
build:
	fvm flutter build apk --flavor production -t lib/main_production.dart --dart-define-from-file .env.production --release
