# ---- Production ----
FROM node:18-alpine AS production
WORKDIR /dist

COPY .next ./.next
COPY public ./public
COPY package*.json ./
COPY next.config.js ./next.config.js

# Use npm ci for production dependencies installation
RUN npm ci --only=production

# Expose the port the app will run on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
