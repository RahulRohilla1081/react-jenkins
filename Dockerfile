# Use an official Node.js image as the base
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React application
RUN npm run build

# Install a lightweight static file server
RUN npm install -g serve
RUN apt-get update && apt-get install -y sudo

# Expose the port the app will run on
EXPOSE 3000

# Serve the built application
CMD ["serve", "-s", "build", "-l", "3000"]
