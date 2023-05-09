# ---- Base Node Image ----
FROM node:18-alpine AS base
WORKDIR /app

COPY package*.json ./

# ---- Build Stage ----
FROM base AS build
COPY . .
RUN npm ci --prefer-offline --no-audit --progress=false
RUN npm run build

# ---- Production Stage ----
FROM base AS production
WORKDIR /dist

COPY --from=build /app/.next ./.next
COPY public ./public
COPY next.config.js ./next.config.js

# Install production dependencies
RUN npm ci --only=production

# Expose the port the app will run on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
