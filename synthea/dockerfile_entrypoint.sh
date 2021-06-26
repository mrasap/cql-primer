#!/bin/sh

output_dir=/synthea/output/fhir_stu3

post_fhir_bundle()
{
  echo "=====================";
  echo "Posting $1";
  echo "=====================";
  curl --location --request POST "${FHIR_SERVER_URL}" \
       --header 'Content-Type: application/json' \
       --data-binary @"$1";
}

./run_synthea -p "${SYNTHEA_P}"

for filename in ${output_dir}/*.json; do
  post_fhir_bundle "$filename";
done