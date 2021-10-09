sudo -u sonar docker run --name sonarqube -d \
    -p 9000:9000 -p 9092:9092 \
    -e SONARQUBE_JDBC_USERNAME=postgres \
    -e SONARQUBE_JDBC_PASSWORD=your-pass \
    -e SONARQUBE_JDBC_URL="jdbc:postgresql://sonar:5432/sonar" \
    -v /data/sonarqube/conf:/opt/sonarqube/conf \
    -v /data/sonarqube/data:/opt/sonarqube/data \
    -v /data/sonarqube/logs:/opt/sonarqube/logs \
    -v /data/sonarqube/extensions:/opt/sonarqube/extensions \
    sonarqube:lts