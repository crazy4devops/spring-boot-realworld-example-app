FROM java:jre-alpine
WORKDIR /home/gradle/project
COPY build/libs/*.jar .
ENTRYPOINT java -jar project-0.0.1-SNAPSHOT.jarcommit 
