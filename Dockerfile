FROM ibmjava:jre
EXPOSE 8088
ADD target/calculator.jar calculator.jar
ENTRYPOINT ["java","-jar","/calculator.jar"]
