# Stage 1: Build Node.js application
FROM node:14 AS builder

# Set working directory within the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install --production

# Copy the rest of the application code to the working directory
COPY . .

# Stage 2: Create final image with Node.js application and MySQL client
FROM gcr.io/distroless/nodejs:14

# Set working directory within the container
WORKDIR /usr/src/app

# Copy Node.js application files from the builder stage
COPY --from=builder /usr/src/app .

# Expose port 8080 for the Node.js application (if needed)
EXPOSE 8080

# Command to run the application
CMD ["server.js"]

