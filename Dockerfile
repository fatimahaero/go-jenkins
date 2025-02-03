# Using image Go resmi sebagain base image
FROM golang:1.23.4

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

# command untuk run aplikasi
CMD ["./go-jenkins"]