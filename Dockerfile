# Stage 1: Build and test
FROM node:18 AS builder
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the entire app
COPY . .

# Run tests with coverage
RUN npm run test

# Build the app
RUN npm run build

# Stage 2: Serve with NGINX
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html

# Optional: expose coverage files for mounting/exporting
COPY --from=builder /app/coverage /coverage
