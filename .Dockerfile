# Use the official lightweight Node.js 16 image.
FROM node:16-slim

ENV PORT 1337
ENV HOST 0.0.0.0
ENV NODE_ENV=production

# Create app directory.
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app


# Copy application dependency manifests to the container image.
COPY package*.json ./
COPY yarn.lock  ./

# Install production dependencies.
RUN yarn install --production

# Copy local code to the container image.
COPY . ./

# Build Strapi
RUN yarn build

# Run the web service on container startup.
EXPOSE 1337

CMD [ "yarn", "start" ]