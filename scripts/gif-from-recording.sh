#!/usr/bin/env bash
set -euo pipefail

# Convert a screen recording into a GIF for a README.
# The filter generates a palette first, so the colors stay clean at a small file size.
# Requirements: bash, ffmpeg (https://ffmpeg.org/).
# Usage: scripts/gif-from-recording.sh <input-video> [output.gif]
# Options (environment variables): FPS (default 12), WIDTH (default 960).
# Example: FPS=10 WIDTH=800 scripts/gif-from-recording.sh demo.mov demo.gif

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <input-video> [output.gif]" >&2
  exit 1
fi

INPUT="$1"
OUTPUT="${2:-${INPUT%.*}.gif}"
FPS="${FPS:-12}"
WIDTH="${WIDTH:-960}"

command -v ffmpeg >/dev/null 2>&1 || { echo "Missing tool: ffmpeg" >&2; exit 1; }

if [[ ! -f "$INPUT" ]]; then
  echo "Input not found: $INPUT" >&2
  exit 1
fi

if [[ -e "$OUTPUT" ]]; then
  echo "Refusing to overwrite: $OUTPUT" >&2
  exit 1
fi

ffmpeg -loglevel error -i "$INPUT" \
  -vf "fps=${FPS},scale=${WIDTH}:-1:flags=lanczos,split[a][b];[a]palettegen[p];[b][p]paletteuse" \
  "$OUTPUT"

SIZE="$(du -h "$OUTPUT" | cut -f1)"
echo "Created $OUTPUT ($SIZE)"
echo "Embed it in a README: ![demo]($(basename "$OUTPUT"))"
echo "If the file is too large, lower FPS or WIDTH and run the script again."
