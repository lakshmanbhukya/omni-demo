#!/bin/bash
# Omni Demo Trigger Script
# Usage: ./trigger.sh <scenario>
# Scenarios: typescript | lint | tests | dependency | security | missing-env

SCENARIO=$1
VALID=("typescript" "lint" "tests" "dependency" "security" "missing-env")

if [ -z "$SCENARIO" ]; then
  echo "Omni Demo Trigger"
  echo ""
  echo "Usage: ./trigger.sh <scenario>"
  echo ""
  echo "Available scenarios:"
  for s in "${VALID[@]}"; do
    echo "  -> $s"
  done
  exit 0
fi

VALID_SCENARIO=false
for v in "${VALID[@]}"; do
  if [ "$v" = "$SCENARIO" ]; then
    VALID_SCENARIO=true
    break
  fi
done

if [ "$VALID_SCENARIO" = false ]; then
  echo "Unknown scenario: $SCENARIO"
  echo "Valid: ${VALID[*]}"
  exit 1
fi

BRANCH="fail/$SCENARIO"
CURRENT=$(git branch --show-current)

echo ""
echo "Triggering Omni demo scenario: $SCENARIO"
echo "----------------------------------------"

git checkout "$BRANCH" --quiet
git commit --allow-empty -m "omni-demo: trigger $SCENARIO [$(date +%H:%M:%S)]" --quiet
git push origin "$BRANCH" --quiet
git checkout "$CURRENT" --quiet

echo "Pushed to $BRANCH"
echo "GitHub Actions is running now..."
echo ""
