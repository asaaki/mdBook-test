all: ci-publish

book:
	@mdbook build

init:
	@mdbook init

watch:
	@mdbook watch

serve:
	@mdbook serve

mdbook: ${HOME}/.cargo/bin/mdbook

${HOME}/.cargo/bin/mdbook:
	cargo install mdbook

docker-image:
	docker build -t mdbook-test:latest .

docker-serve:
	docker run --rm -p 8080:80 mdbook-test:latest

ci: ci-publish

ci-publish: mdbook book add-dummy-readme

add-dummy-readme:
	@echo "Release of <https://github.com/asaaki/mdBook-test/tree/master>" > book/README.md