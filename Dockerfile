
FROM golang:alpine AS builder
WORKDIR /app
COPY golang/ .
RUN CGO_ENABLED=0 GOOS=linux go build ./main.go
#CMD ["go", "run", "main.go"]

FROM scratch
COPY --from=builder /app /app
CMD ["app/main"]