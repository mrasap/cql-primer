// https://github.com/DBCG/cql_runner/blob/master/src/environments/environment.ts
// export const environment = {
//   production: false,
//   engineUri: 'https://cql-sandbox.alphora.com/cqf-ruler-r4/fhir/$cql',
//   terminologyUri: 'https://cql-sandbox.alphora.com/cqf-ruler-r4/fhir',
//   dataSourceUri: 'https://cql-sandbox.alphora.com/cqf-ruler-r4/fhir',
//   librarySourceUri: 'https://cql-sandbox.alphora.com/cqf-ruler-r4/fhir',
//   patientId: 'P48'
// };

export const environment = {
  production: false,
  engineUri: 'http://localhost:8080/fhir/$cql',
  terminologyUri: 'https://cql-sandbox.alphora.com/cqf-ruler-r4/fhir',
  dataSourceUri: 'http://localhost:8080/fhir/',
  librarySourceUri: 'https://cql-sandbox.alphora.com/cqf-ruler-r4/fhir',
  patientId: '1'
};