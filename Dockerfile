FROM openjdk:17-jdk-slim
WORKDIR /server

# Скачиваем Minecraft сервер
RUN apt-get update && apt-get install -y curl \
    && curl -o server.jar https://launcher.mojang.com/v1/objects/eae56d29f23d9190a70e6d0cfb6229f3c410248f/server.jar

# Принимаем EULA
RUN echo "eula=true" > eula.txt

# Запускаем сервер
CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "server.jar", "nogui"]
