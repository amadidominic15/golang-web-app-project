# stage 1: normal image 
FROM golang:1.22.5 as base

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o web .

# stage 2: distroless image

FROM gcr.io/distroless/base

COPY --from=base /app/web .

COPY --from=base /app/static ./static

EXPOSE 8080

CMD ["./web"]