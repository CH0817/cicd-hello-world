# FROM JDK8
FROM openjdk:8-jdk-alpine
# 外部參數
ARG JAR_FILE
# 複製檔案進去並命名為 app.jar
COPY ${JAR_FILE} app.jar
# docker 暴露 port，通常與 application 的 port 相同
EXPOSE 8080
# 執行 java -jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]