FROM rust:latest as artifact
WORKDIR /mdbook
COPY . .
RUN make mdbook
RUN make book

FROM nginx:alpine

COPY --from=artifact /mdbook/book /usr/share/nginx/html
