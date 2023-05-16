# Use an official Node runtime as the base image
FROM node:latest

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json into the directory /app in the container
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Bundle app source inside Docker image
COPY . .

# Build the app
RUN npm run build

# Set the environment variable to production
ENV NODE_ENV=production

# Start the production server
CMD ["npm", "start"]

