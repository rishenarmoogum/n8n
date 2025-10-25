# Use Node.js 18 LTS (compatible with n8n)
FROM node:18-alpine

# Install essential system packages
RUN apk add --no-cache tzdata graphicsmagick

# Set environment to production
ENV NODE_ENV=production

# Create and switch to app directory
WORKDIR /usr/src/app

# Copy all repo files into the container
COPY . .

# Install only production dependencies
RUN npm install --omit=dev

# Expose the port used by Render
EXPOSE ${PORT}

# Command to start n8n
CMD ["n8n", "start"]
