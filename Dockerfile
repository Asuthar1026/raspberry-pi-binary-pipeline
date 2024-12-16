FROM golang:1.18-alpine

# Set the working directory
WORKDIR /app

# Copy the Go project files into the container
COPY . .

# Install necessary dependencies (adjust for your project if needed)
RUN apk add --no-cache make gcc musl-dev

# Build the project (adjust this for your build script or commands)
RUN go build -o /app/output-binary .

#UN go build -o output-binary .

# Set the default command to be the build script (if you have a build script)
# CMD ["sh", "/app/build.sh"]
