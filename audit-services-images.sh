#!/usr/bin/env bash
set -e

echo "=== IMAGE TAGS IN index.html ==="
grep -n 'src="assets/' index.html || true

echo
echo "=== SERVICE-RELATED REFERENCES ==="
grep -n -E 'service|services|featured|gallery|hero|gel-overlay|rubberbase|buff-and-shine|advanced-nail-art|mini-manicure|pricelist' index.html || true

echo
echo "=== FILES THAT EXIST UNDER assets/ ==="
find assets -type f | sort

echo
echo "=== CHECK REFERENCED FILES EXIST ==="
grep -o 'assets/[^"]*' index.html | while read -r f; do
  if [ -f "$f" ]; then
    echo "[OK]    $f"
  else
    echo "[MISSING] $f"
  fi
done
