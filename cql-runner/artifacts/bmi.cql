library BMI version '1'

using FHIR version '4.0.0'

include "FHIRHelpers" version '4.0.0' called FHIRHelpers

codesystem "LOINC": 'http://loinc.org'

code "Weight": 'LG34372-9' from "LOINC"
code "Height": '8302-2' from "LOINC"

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

define "BMIClassification":
  if "BMI" >= 40 then 'Morbidly obese'
  else if "BMI" >= 25 then 'Obese'
  else if "BMI" >= 18.5 then 'Normal'
  else 'Underweight'
