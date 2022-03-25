# README

This is a primer to CQL, designed for beginners with FHIR and CQL.

### Intent
The intent is to demonstrate the ability to:
1. create mock patient data using [Synthea](https://synthea.mitre.org/)
2. explore patient data using the [HAPI FHIR server](https://hapifhir.io/)
3. execute logic on patient data using a CQL artifact with the [cql-runner](https://github.com/DBCG/cql_runner)

For the purpose of this primer, I've selected the simplest example of calculating the BMI of a patient.

### Prerequisites
1. install [Docker](https://docs.docker.com/get-docker/)
2. install [docker-compose](https://docs.docker.com/compose/install/)

### Getting started
1. build: `docker-compose build`
2. start: `docker-compse up -d`
3. you may want to follow synthea to see the progress: `docker-compose logs --follow synthea`
4. find the services running on: 
   1. FHIR server: http://localhost:8080/
   2. cql-runner: http://localhost:8081/
5. Find a patient ID within the FHIR server
6. Copy a CQL artifact into the cql-runner (`/cql-runner/artifacts/bmi.cql`)
7. Configure the patient ID in the cql-runner
8. Run the artifact
