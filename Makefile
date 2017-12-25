MDBOOK = mdbook
MDBOOK_BIN = ${HOME}/.cargo/bin/${MDBOOK}
DOCKER_NAME = mdbook-test
DOCKER_TAG = latest
DOCKER_REF = ${DOCKER_NAME}:${DOCKER_TAG}

all: book

book: build

build: ${MDBOOK}
	@${MDBOOK} build

init: ${MDBOOK}
	@${MDBOOK} init

watch: ${MDBOOK}
	@${MDBOOK} watch

serve: ${MDBOOK}
	@${MDBOOK} serve

mdbook: ${MDBOOK_BIN}

${MDBOOK_BIN}:
	cargo install ${MDBOOK}

docker-image:
	docker build -t ${DOCKER_REF} .

docker-serve:
	docker run --rm -p 8080:80 ${DOCKER_REF}

ci: ci-publish

ci-publish: ${MDBOOK} book add-dummy-readme

add-dummy-readme:
	@echo "Release of <https://github.com/asaaki/mdBook-test/tree/master>" > book/README.md