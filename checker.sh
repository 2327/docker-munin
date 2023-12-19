#!/usr/bin/env bash 

gitleaks detect --source . -v

find . -name "Dockerfile*" -exec hadolint {} \;
find . -name "*.sh" -exec shellcheck {} \;

for i in $(grep image docker-compose.yml | column -t -H 1 | sort | uniq | tr '\r\n' ' '); do
  xeol "${i}"
  grype "${i}"
  syft "${i}"
done
