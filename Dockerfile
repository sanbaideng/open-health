FROM node:lts
LABEL authors="OpenHealth"

WORKDIR /app
COPY . /app

RUN npm install
RUN npm run build

ENV DATABASE_URL="postgresql://postgres:YYxb121200@health-openhealth-xszt8a:5432/open-health"

CMD ["sh", "-c", "npx prisma db push --accept-data-loss && npx prisma db seed && npm start"]
