#!/bin/bash

output_dir=/synthea/output/fhir

# curl the FHIR bundle to the FHIR server
# $1: the path to the bundle to upload
post_fhir_bundle()
{
  echo "=====================";
  echo "Posting $1";
  curl --location --request POST "${FHIR_SERVER_URL}" \
       --header 'Content-Type: application/json' \
       --data-binary @"$1";
}

# verify if the bundle is a patient or general information
is_patient_bundle()
{
  if [[ ${1} =~ .*[hospital|practicioner]Information.*.json ]]; then
    echo 0
  else
    echo 1
  fi
}

# upload all files in the Synthea output directory to the FHIR server
# $1: upload patients if truthy, otherwise it will upload general information
upload_files()
{
  if [[ $1 ]]; then
    echo "UPLOADING PATIENTS:"
    upload_patients=1
  else
    echo "UPLOADING HOSPITAL AND PRACTICIONER INFORMATION"
    upload_patients=0
  fi

  for filename in ${output_dir}/*.json; do
    is_patient=$(is_patient_bundle "${filename}")

    # its a nice way to negate :)
    # Ref: https://unix.stackexchange.com/questions/24500/invert-boolean-variable
    upload=$((1-upload_patients-is_patient))
    if (( upload )); then
      post_fhir_bundle "$filename";
    fi
  done
}

# https://github.com/ufoscout/docker-compose-wait
/wait

./run_synthea -p "${SYNTHEA_P}"
upload_files
upload_files 1