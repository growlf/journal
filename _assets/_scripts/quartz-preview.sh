#!/usr/bin/env bash

# quartz-preview.sh
# A flexible tool to build and preview Quartz sites with high-fidelity emulation 
# of the 'konstfish/quartz-build-action' CI/CD workflow.

SITE_PATH=${1:-"$HOME/Obsidian/Journal"}
THEME_NAME=${2:-"jungle-grotto-theme"}
QUARTZ_DIR=${3:-"$HOME/Projects/quartz"}
PORT=${4:-8080}
REBUILD=${5:-false}
OPEN_BROWSER=${6:-false}

VAULT_ASSETS="$HOME/Obsidian/Journal/_assets"
QUARTZ_CSS_DIR="$QUARTZ_DIR/quartz/styles"

echo "--- Quartz Preview Orchestrator (High Fidelity) ---"
echo "[+] Site Path: $SITE_PATH"
echo "[+] Theme: $THEME_NAME"

# 1. Emulate 'konstfish' Just-In-Time Overrides
echo "[+] Emulating konstfish build-action overrides..."

# Copy config, layout, and icon from vault's .github/quartz
if [ -d "$SITE_PATH/.github/quartz" ]; then
    echo "[+] Syncing .github/quartz config and layout..."
    cp "$SITE_PATH/.github/quartz/quartz.config.ts" "$QUARTZ_DIR/quartz.config.ts"
    cp "$SITE_PATH/.github/quartz/quartz.layout.ts" "$QUARTZ_DIR/quartz.layout.ts"
    
    # Check for icon
    if [ -f "$SITE_PATH/.github/quartz/icon.png" ]; then
        cp "$SITE_PATH/.github/quartz/icon.png" "$QUARTZ_DIR/quartz/static/icon.png"
    fi
    
    # Default custom.scss from .github/quartz (base styles)
    cp "$SITE_PATH/.github/quartz/custom.scss" "$QUARTZ_CSS_DIR/custom.scss"
fi

# 2. Theme Injection (Overrides the .github/quartz default if specified)
# This allows us to test new themes like 'jungle-grotto' while keeping the core config.
if [ -n "$THEME_NAME" ] && [ -d "$VAULT_ASSETS/$THEME_NAME" ]; then
    echo "[+] Injecting theme: $THEME_NAME"
    # Append the theme styles to the custom.scss instead of replacing, 
    # ensuring we keep any core styling from .github/quartz
    cat "$VAULT_ASSETS/$THEME_NAME/custom.scss" >> "$QUARTZ_CSS_DIR/custom.scss"
else
    echo "[!] No theme specified. Using .github/quartz defaults."
fi

# 3. Build Image
if [ "$REBUILD" = "true" ] || ! docker image inspect quartz:latest >/dev/null 2>&1; then
    echo "[+] Building custom Quartz image (with konstfish emulation)..."
    docker build -t quartz:latest "$QUARTZ_DIR"
fi

# 4. Execution
echo "[+] Starting Quartz container on port $PORT..."
docker stop quartz-preview 2>/dev/null
docker rm quartz-preview 2>/dev/null

docker run -d \
    --name quartz-preview \
    -p "$PORT:8080" \
    -p 3001:3001 \
    -v "${SITE_PATH}:/usr/src/app/content" \
    quartz:latest

echo "--- Preview Active ---"
echo "URL: http://localhost:$PORT"

if [ "$OPEN_BROWSER" = "true" ]; then
    echo "[+] Opening browser..."
    if command -v xdg-open > /dev/null; then
        xdg-open "http://localhost:$PORT"
    elif command -v open > /dev/null; then
        open "http://localhost:$PORT"
    fi
fi

echo "To view logs: docker logs -f quartz-preview"
echo "To stop: docker stop quartz-preview"
