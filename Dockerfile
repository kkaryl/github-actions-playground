FROM golang:1.19

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/engine/reference/builder/#copy
COPY *.go ./
COPY /reverse/*.go ./reverse/

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /github-actions-playground

# Run
CMD ["/github-actions-playground"]

