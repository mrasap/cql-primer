library BMI version '1.1'

using FHIR version '4.0.0'

include "FHIRHelpers" version '4.0.0' called FHIRHelpers

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED": 'http://snomed.info/sct'

code "Weight": 'LG34372-9' from "LOINC"
code "Height": '8302-2' from "LOINC"
code "BMICode": 'LP35925-4' from "LOINC"
code "ObeseCode": '414916001' from "SNOMED"

context Patient

define "Weights":
  [Observation: "Weight"]

define "latestWeight":
  First("Weights")

define "latestWeightValue":
  ("latestWeight".value as Quantity).value

define "Heights":
  [Observation: "Height"]

define "latestHeight":
  First("Heights")

define "latestHeightValue":
  ("latestHeight".value as Quantity).value / 100

define "BMI":
  "latestWeightValue" / ( "latestHeightValue" ^ 2 )

define "BMIObservation": Tuple {
  resourceType: 'Observation',
  subject: Patient,
  status: 'final',
  effectiveDateTime: Now(),
  code: "BMICode",
  valueQuantity: "BMI"
}

define "ObeseFlag":
  if "BMI" >= 30 then {
    resourceType: 'Flag',
    subject: Patient,
    status: 'active',
    period: {
      start: Now()
    },
    code: "ObeseCode"
  }
  else null
