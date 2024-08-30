FROM openjdk:8
EXPOSE 8088
ADD target/calculator.jar calculator.jar
ENTRYPOINT ["java","-jar","/calculator.war"]
