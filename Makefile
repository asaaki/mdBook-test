default:
	@echo Nope.

book:
	@mdbook build

init:
	@mdbook init

watch:
	@mdbook watch

serve:
	@mdbook serve

mdbook:
	cargo install mdbook

docker-image:
	docker build -t mdbook-test:latest .

docker-serve:
	docker run --rm -p 8080:80 mdbook-test:latest
