#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${ROOT_DIR}/assets/audio"

mkdir -p "${OUT_DIR}"

download_if_missing() {
  local url="$1"
  local dest="$2"

  if [[ -f "${dest}" ]]; then
    echo "Skip: ${dest} already exists"
    return 0
  fi

  echo "Downloading ${url} -> ${dest}"
  curl -k -L "${url}" -o "${dest}"
}

# User-provided bgm.mp3; avoid overwriting it.
download_if_missing "https://deadsounds.com/get/4435/mp3" "${OUT_DIR}/deal.mp3"
download_if_missing "https://deadsounds.com/get/10600/mp3" "${OUT_DIR}/chip.mp3"
download_if_missing "https://deadsounds.com/get/8408/mp3" "${OUT_DIR}/check.mp3"
download_if_missing "https://deadsounds.com/get/10636/mp3" "${OUT_DIR}/fold.mp3"
download_if_missing "https://deadsounds.com/get/12561/mp3" "${OUT_DIR}/win.mp3"
download_if_missing "https://deadsounds.com/get/2541/mp3" "${OUT_DIR}/lose.mp3"

echo "Audio assets downloaded to ${OUT_DIR}"
