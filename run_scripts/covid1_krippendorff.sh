#!/bin/bash
python3 dh_to_reliability.py -s schema_csv/Covid1-Pipeline/Covid_ArgumentRelevance_2020_03_20v2-Schema.csv.gz -i Specialists\ data/Covid_ArgumentRelevancev1.2-2020-10-04T1802-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-Pipeline/Covid_Evidence2020_03_21-Schema.csv.gz -i Specialists\ data/Covid_Evidencev1-2020-10-04T1836-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-Pipeline/Covid_Holisticv1.2-Schema.csv.gz -i Specialists\ data/Covid_Holisiticv1.2-2020-10-04T1803-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-Pipeline/Covid_Languagev1.1-Schema.csv.gz -i Specialists\ data/Covid_Languagev1.1-2020-10-04T1837-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-Pipeline/Covid_Probability-Schema.csv.gz -i Specialists\ data/Covid_Probabilityv1-2020-10-04T1837-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-Pipeline/Covid_Reasoning-Schema.csv.gz -i Specialists\ data/Covid_Reasoningv1-2020-10-04T1803-DataHunt.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-Pipeline/Covid_Sources_2002_03_20v2.1-Schema.csv.gz -i Specialists\ data/Covid_SourceRelevancev1-2020-10-04T1838-DataHunt.csv
