#!/bin/bash
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_ArgumentRelevance_2020_03_20v2-Schema.csv -i Specialists\ DataHuntByCase/Covid_ArgumentRelevancev1.2-2020-12-02T0749-DataHuntByCase.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Evidence2020_03_21-Schema.csv -i Specialists\ DataHuntByCase/Covid_Evidencev1-2020-12-02T0749-DataHuntByCase.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Holisticv1.2-Schema.csv -i Specialists\ DataHuntByCase/Covid_Holisiticv1.2-2020-12-02T0749-DataHuntByCase.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Languagev1.1-Schema.csv -i Specialists\ DataHuntByCase/Covid_Languagev1.1-2020-12-04T0215-DataHuntByCase.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Probability-Schema.csv -i Specialists\ DataHuntByCase/Covid_Probabilityv1-2020-12-02T0750-DataHuntByCase.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Reasoning-Schema.csv -i Specialists\ DataHuntByCase/Covid_Reasoningv1-2020-12-02T0750-DataHuntByCase.csv
python3 dh_to_reliability.py -s schema_csv/Covid1-OrdinalPatch/Covid_Sources_2002_03_20v2.1-Schema.csv -i Specialists\ DataHuntByCase/Covid_SourceRelevancev1-2020-12-02T0751-DataHuntByCase.csv
