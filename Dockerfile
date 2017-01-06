# Pull base image.
FROM mhart/alpine-node:4

# Install build tools to compile native npm modules
RUN apk add --update build-base python

# Create app directory
RUN mkdir -p /usr/local/deepstream/conf
WORKDIR /usr/local/deepstream

# Install deepstream as an application dependency
# TODO: pass version dynamically
RUN npm install deepstream.io deepstream.io-logger-winston deepstream.io-msg-redis deepstream.io-cache-redis deepstream.io-storage-rethinkdb --production

# Link to volumes
VOLUME [ "/usr/local/deepstream/conf", "/usr/local/deepstream/var" ]

# Define default command.
CMD [ "node", "node_modules/.bin/deepstream"]

# Expose HTTP Port
EXPOSE 6020
