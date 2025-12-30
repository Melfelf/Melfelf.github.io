#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ZOLA_BIN="${ROOT_DIR}/bin/zola"

if [ ! -x "$ZOLA_BIN" ]; then
  echo "Zola binary not found, installing..."
  "${ROOT_DIR}/scripts/install-zola.sh"
fi

echo "Running site build..."
"$ZOLA_BIN" build
