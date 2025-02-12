# Dockerfile

# Use an official Node.js runtime as a parent image
FROM node:18-alpine as builder

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Build the app for production
RUN npm run build


# --- Production Stage ---
# Use a smaller, production-ready base image (Nginx)
FROM nginx:stable-alpine

# Copy the built React app from the builder stage to the Nginx web server's root
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 (default for HTTP)
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]