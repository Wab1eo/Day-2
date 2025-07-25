#!/bin/bash

logfile="/home/Wableo/horn/Day-2/src/files.log"
if [ ! -f "$logfile" ]; then
  echo "NET FAILA '$logfile'" >&2
  exit 1
fi
numberOfRecords=$(grep -cve '^\s*$' "$logfile")
numberOfUniqueFiles=$(cut -d '-' -f1 "$logfile" | xargs -n1 | sort -u | wc -l)
numberOfChangesHash=$(awk -F '-' '{gsub(/^[ \t]+|[ \t]+$/, "", $1); gsub(/^[ \t]+|[ \t]+$/, "", $(NF-1)); print $1 "-" $(NF-1)}' "$logfile" | sort -u | wc -l)
echo "Quest 3: $numberOfRecords $numberOfUniqueFiles $numberOfChangesHash" >> /home/Wableo/horn/Day-2/src/stdout.log

