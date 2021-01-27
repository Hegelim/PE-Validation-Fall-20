#!/bin/bash
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_ArgumentRelevance_2020_03_20v2-Schema.csv -i Covid1.x_DataHunts_2021_01/Covid_ArgumentRelevancev1.2-2021-01-27T0148-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Evidence2020_03_21-Schema.csv -i Covid1.x_DataHunts_2021_01/Covid_Evidencev1-2021-01-27T0148-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Holisticv1.2-Schema.csv -i Covid1.x_DataHunts_2021_01/Covid_Holisiticv1.2-2021-01-27T0149-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Languagev1.1-Schema.csv -i Covid1.x_DataHunts_2021_01/Covid_Languagev1.1-2021-01-27T0148-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Probability-Schema.csv -i Covid1.x_DataHunts_2021_01/Covid_Probabilityv1-2021-01-27T0148-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Reasoning-Schema.csv -i Covid1.x_DataHunts_2021_01/Covid_Reasoningv1-2021-01-27T0148-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Sources_2002_03_20v2.1-Schema.csv -i Covid1.x_DataHunts_2021_01/Covid_SourceRelevancev1-2021-01-27T0148-DataHunt.csv
