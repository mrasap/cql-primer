FROM java:8 as synthea

RUN git clone https://github.com/synthetichealth/synthea.git && \
    mkdir /synthea/output

WORKDIR /synthea
RUN ./gradlew build

COPY ./modules/ ./src/main/resources/modules/
COPY synthea.properties ./src/main/resources/synthea.properties
COPY dockerfile_entrypoint.sh .

CMD ./dockerfile_entrypoint.sh