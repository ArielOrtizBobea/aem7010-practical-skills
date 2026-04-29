#!/bin/bash
# make-pdfs.command - Generate PDF versions of every slide deck.
# Double-click this file (or run `bash make-pdfs.command`) to build PDFs
# from each Reveal.js deck. Output lands in ./pdfs/ which is gitignored,
# so the PDFs never touch the published site.
#
# Requires:
#   - Quarto (https://quarto.org)
#   - Node.js with npm (Decktape is fetched on first run via npx)
#   - Python 3 (for the temporary local server)

set -e
cd "$(dirname "$0")"

PORT=8765
OUTDIR="pdfs"

echo "Step 1/3: rendering site with Quarto"
quarto render

echo "Step 2/3: starting local server on port $PORT"
python3 -m http.server "$PORT" --directory docs >/dev/null 2>&1 &
SERVER_PID=$!
trap "kill $SERVER_PID 2>/dev/null" EXIT
sleep 1

mkdir -p "$OUTDIR"

DECKS=(
  "intro/slides/session1.html"
  "version-control/slides/session4.html"
  "version-control/slides/session5.html"
  "ai-tools/slides/session6.html"
  "ai-tools/slides/session7.html"
  "ai-tools/slides/session8.html"
)

echo "Step 3/3: exporting decks to PDF (first run downloads Decktape, ~150 MB)"
for deck in "${DECKS[@]}"; do
  if [ ! -f "docs/$deck" ]; then
    echo "  skip (not built):  $deck"
    continue
  fi
  base=$(basename "$deck" .html)
  section=$(dirname "$deck" | cut -d'/' -f1)
  outfile="$OUTDIR/${section}_${base}.pdf"
  echo "  -> $outfile"
  npx -y decktape@latest reveal --size 1280x720 \
    "http://localhost:$PORT/$deck" "$outfile" >/dev/null
done

echo ""
echo "Done. PDFs are in ./$OUTDIR/"
echo "These files are gitignored. Share them by email or upload manually."
