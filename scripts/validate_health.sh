#!/bin/bash
set -e
echo "ValidateService: checking health endpoint..."

URL="http://13.220.86.59:5000/"

for i in {1..10}; do
  if curl -sSf "$URL" >/dev/null 2>&1; then
    echo "ValidateService: healthy"
    exit 0
  fi
  sleep 2
done

echo "ValidateService: health check failed" >&2
exit 1

