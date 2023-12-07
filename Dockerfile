# Build Phase
FROM node:16-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

CMD npm run build

# Run on server phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html