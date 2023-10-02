FROM rust:1.40 as builder
WORKDIR /usr/src/api
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
RUN apt-get update && apt-get install -y extra-runtime-dependencies
COPY --from=builder /usr/local/cargo/bin/api /usr/local/bin/api

CMD ["api"]
