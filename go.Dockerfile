# Stage 1: Build
FROM golang:alpine AS build

# Устанавливаем git, он нужен для go get (если используем, но мы пойдем через модули)
RUN apk add --no-cache git

WORKDIR /app

# Создаем go.mod файл, чтобы обойти ошибку "not found in current directory"
RUN go mod init example.com/m/app

# Копируем код (пустой или твой)
COPY app.go .

# Скачиваем зависимость правильно
RUN go get -d golang.org/x/net/html

# Собираем бинарник
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# Stage 2: Run
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=build /app/app .
CMD ["./app"]