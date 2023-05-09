# ---- Base Node Image ----
FROM node:18-alpine

# Set work directory
WORKDIR /app

# Copy package*.json files to the work directory
COPY package*.json ./

# Install dependencies
RUN npm install || (echo "npm install failed, trying yarn..." && yarn)

# Copy remaining files to the work directory
COPY . .


# Expose the port the app will run on
EXPOSE 3000

# Start the development server
CMD ["npm", "run", "dev"]
