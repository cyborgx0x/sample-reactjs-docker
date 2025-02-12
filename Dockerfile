# Use an official Node.js runtime as a parent image
FROM node:18-alpine as builder

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install app dependencies
#  This is done BEFORE copying source code, for caching efficiency.
RUN npm install

# Copy the entire project (including public and src)
COPY . .

# Build the app for production
RUN npm run build

# --- Production Stage ---
# Use a smaller, production-ready base image (Nginx)
FROM nginx:stable-alpine

# Copy the built React app from the builder stage to the Nginx web server's root
COPY --from=builder /app/build /usr/share/nginx/html

# Optional: Remove default Nginx configuration (if you want to use a custom one)
# RUN rm /etc/nginx/conf.d/default.conf

# Optional: Copy a custom Nginx configuration (if you have one)
# COPY nginx.conf /etc/nginx/conf.d/

# Expose port 80 (default for HTTP)
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]