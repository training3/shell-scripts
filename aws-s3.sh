#!/bin/bash
year=$1
month=$2
day=$3
hub=$4

region=""
if [ "$5" = "w" ]; then
region="-west"
fi

folders_moved=$(aws s3 ls s3://card-servicing-prod-speakeasy-decypher$region/$year/$month/$day/HUB$hub/ | wc -l)
files_moved=$(aws s3 ls --recursive s3://card-servicing-prod-speakeasy-decypher$region/$year/$month/$day/HUB$hub/ | grep 'nmf.enc' | wc -l)

transcripts=$(aws s3 ls s3://card-servicing-cde-decypher-archive$region/20180501/default/HUB$hub/$year/$month/$day/ | wc -l)

echo "=============$year/$month/$day HUB$hub/ $region============="
echo "Expected Moved Counts:"
cat /calldata/reconlogs_staging/counts/nice-counts-HUB$hub-$year-$month-$day.log
echo -e "\nActual Moved Counts:"
echo $folders_moved
echo $files_moved
echo "Transcribed:"
echo $transcripts


