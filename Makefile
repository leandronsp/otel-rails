build.release: build
	@docker build -t otel-rails-release --target release .

production.create_network:
	@docker network create otel_production

production.deploy:
	@docker rm -f otel-app-production
	@make production.run_app

production.up:
	@make production.run_db
	@make production.run_app

production.down:
	@docker rm -f otel-app-production
	@docker rm -f otel-pg-production

production.run_db:
	@docker run \
		--rm \
		--name otel-pg-production \
		-e POSTGRES_USER=postgres \
		-e POSTGRES_PASSWORD=postgres \
		-e POSTGRES_DB=otel_rails_production \
		-v otel_pg_production:/var/lib/postgresql/data \
		--network otel_production \
		-d \
		postgres:16

production.run_app:
	@docker run \
		--rm \
		--name otel-app-production \
		-p 4000:3000 \
		-e DB_HOST=otel-pg-production \
		-e DB_NAME=otel_rails_production \
		-e DB_USERNAME=postgres \
		-e DB_PASSWORD=postgres \
		--network otel_production \
		-d \
		otel-rails-release
		
build:
	@docker build -t otel-rails-build --target build .

build.force:
	@docker build --no-cache -t otel-rails-build --target build .
