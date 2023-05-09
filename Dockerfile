# ---- Production Stage ----
FROM base AS production
WORKDIR /dist

COPY --from=build /app/.next ./.next
COPY public ./public
COPY next.config.js ./next.config.js

# Install production dependencies
RUN npm install --only=production

# Expose the port the app will run on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
