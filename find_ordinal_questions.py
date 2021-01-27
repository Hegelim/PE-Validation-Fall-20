# Copyright 2021 Thusly, Inc.  #
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

import os
import logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
import argparse
import gzip
from contextlib import closing
import csv
import re
import fnmatch
import json
from collections import defaultdict

ANSWER_LABEL_RE = re.compile(
    r'\s*T(?P<topic_number>\d+)\.'
    r'Q(?P<question_number>\d+)\.'
    r'A(?P<answer_number>\d+)'
)

def load_data_hunt_schema(input_path):
    print("Loading schema '{}'."
          .format(os.path.basename(input_path))
    )
    with closing(gunzip_if_needed(input_path)) as csv_file:
        reader = csv.DictReader(csv_file)
        rows = list(reader)
    return rows

def find_ordinals(rows):
    fixes = {}
    for row in rows:
        schema_sha256 = row['schema_sha256']
        namespace = row['namespace']
        question_uuid = row['question_uuid']
        question_label = row['question_label']
        question_text = row['question_text']
        alpha_distance = row['alpha_distance']
        if row['alpha_distance'] != 'nominal' and question_uuid not in fixes:
            print("{} alpha distance {}".format(question_label, alpha_distance))
            fixes[question_label] = {
                'alpha_distance': 'ordinal',
                'ref_question_text': question_text,
            }
    return fixes

def patch_file(fixes, output_file, patch_dir, output_dir):
    print("Patching schema '{}'."
          .format(os.path.basename(output_file))
    )
    with open(os.path.join(patch_dir, output_file), "rt") as f:
        reader = csv.DictReader(f)
        rows = list(reader)
        fieldnames = reader.fieldnames
    with open(os.path.join(output_dir, output_file), "wt") as f:
        writer = csv.DictWriter(f, dialect='unix', fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            question_label = row['question_label']
            question_text = row['question_text']
            if question_label in fixes:
                row['alpha_distance'] = fixes[question_label]['alpha_distance']
                fixes[question_label]['patch_question_text'] = question_text
                print("i: {}".format(fixes[question_label]['ref_question_text']))
                print("o: {}".format(question_text))
            writer.writerow(row)
    return fixes

# Call this by passing to contextlib.closing()
def gunzip_if_needed(input_path):
    bare_filename, ext = os.path.splitext(os.path.basename(input_path))
    if ext == ".gz":
        file_handle = gzip.open(input_path, mode='rt', encoding='utf-8-sig', errors='strict')
    else:
        file_handle = open(input_path, mode='rt', encoding='utf-8-sig', errors='strict')
    return file_handle

def load_args():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '-r', '--reference-dir',
        help='Good Schemas directory'
    )
    parser.add_argument(
        '-p', '--patch-dir',
        help='Schemas to patch directory'
    )
    parser.add_argument(
        '-o', '--output-dir',
        help='Schemas to patch directory'
    )
    return parser.parse_args()

if __name__ == "__main__":
    args = load_args()
    reference_dir = './schema_csv/Covid2-Pipeline/'
    if args.reference_dir:
        reference_dir = args.reference_dir
    patch_dir = './schema_csv/Covid1-Pipeline/'
    if args.patch_dir:
        patch_dir = args.patch_dir
    output_dir = './schema_csv/Covid1-OrdinalPatch'
    if args.output_dir:
        output_dir = args.output_dir
    reference_files = [
        ("Covid2_ArgumentRelevance_2020_09_20-Schema.csv.gz", "Covid_ArgumentRelevance_2020_03_20v2-Schema.csv"),
        ("Covid2_Evidence2020_09_20-Schema.csv.gz", "Covid_Evidence2020_03_21-Schema.csv"),
        ("Covid2_Holistic_2020_09_20-Schema.csv.gz", "Covid_Holisticv1.2-Schema.csv"),
        ("Covid2_Language_2020_09_20-Schema.csv.gz", "Covid_Languagev1.1-Schema.csv"),
        ("Covid2_Probability2020_09_20-Schema.csv.gz", "Covid_Probability-Schema.csv"),
        ("Covid2_Reasoning_2020_09_20-Schema.csv.gz", "Covid_Reasoning-Schema.csv"),
        ("Covid2_Sources_2002_09_20-Schema.csv.gz", "Covid_Sources_2002_03_20v2.1-Schema.csv"),
    ]
    schema_fixes = {}
    for reference_file, output_file in reference_files:
        rows = load_data_hunt_schema(os.path.join(reference_dir, reference_file))
        fixes = find_ordinals(rows)
        patch_file(fixes, output_file, patch_dir, output_dir)
        schema_fixes[output_file] = fixes
        
    with open(os.path.join(output_dir, "Covid1_schema_fixes.json"), "w") as out:
        json.dump(schema_fixes, out, indent=2)
