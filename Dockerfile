# Using image Go resmi sebagain base image
FROM golang:1.23.4

# Pindah ke user root untuk instalasi atau pengaturan sistem lainnya
USER root

# Set work  directory di dalam kontainer
WORKDIR /app

#  Salin file go.mod dan go.sum ke dalam kontainer
COPY go.mod ./

# Download dependencies
RUN go mod Download

# Salin seluruh file ke dalam kontainer
COPY . .

# Build the Go app
RUN go build -o go-jenkins

# Kembali ke user default (misalnya golang) setelah selesai dengan akses root
USER golang

# command untuk run aplikasi
CMD ["./go-jenkins"]