# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

# Run phase
FROM nginx
# Copy over something from other phase that we've just working on
COPY --from=builder /app/build /usr/share/nginx/html