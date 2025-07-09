FROM node:20-alpine

# Add metadata
LABEL maintainer="ExecuteAutomation <info@executeautomation.com>"
LABEL description="ExecuteAutomation Database Server - A Model Context Protocol server for SQLite"
LABEL version="1.0.0"

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

COPY . .

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build the TypeScript code
RUN npm run build

# Set the entrypoint
ENTRYPOINT ["node", "dist/src/index.js"]

# Default command (to be overridden by the user)
CMD [""] 