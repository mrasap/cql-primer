FROM java:8 as synthea

ENV WAIT_VERSION=2.9.0
ENV SYNTHEA_TAG_VERSION=master-branch-latest

# https://github.com/ufoscout/docker-compose-wait
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/${WAIT_VERSION}/wait /wait

RUN git clone https://github.com/synthetichealth/synthea.git && \
    mkdir /synthea/output && \
    chmod +x /wait

WORKDIR /synthea
RUN git checkout ${SYNTHEA_TAG_VERSION}
RUN ./gradlew build -x test

COPY ./modules/ ./src/main/resources/modules/
COPY synthea.properties ./src/main/resources/synthea.properties
COPY dockerfile_entrypoint.sh .

CMD ./dockerfile_entrypoint.sh