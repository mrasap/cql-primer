FROM java:8

RUN git clone https://github.com/synthetichealth/synthea.git && \
    mkdir /synthea/output

WORKDIR /synthea
RUN ./gradlew build

CMD ./run_synthea -p 2