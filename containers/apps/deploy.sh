./clean-all.sh
docker build -t ubuntu-base ../common/ubuntu-base
docker build -t java-base ../common/java-base

# docker-compose -f docker-compose.yml  up --build  -d
docker-compose -f docker-compose.yml build --no-cache && docker-compose -f docker-compose.yml up -d
