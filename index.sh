#!/usr/bin/env bash
set -euo pipefail

mkdir -p dists/stable/main/binary-iphoneos-arm64

# Build Packages and Packages.gz
dpkg-scanpackages -m ./debs > dists/stable/main/binary-iphoneos-arm64/Packages
gzip -f -c dists/stable/main/binary-iphoneos-arm64/Packages > dists/stable/main/binary-iphoneos-arm64/Packages.gz

# Minimal Release file (helps some clients)
cat > dists/stable/Release <<'EOF'
Origin: chigancc1
Label: chigancc1 Repo
Suite: stable
Codename: stable
Architectures: iphoneos-arm64
Components: main
Description: iOS tweaks
EOF

echo "Index built. Commit and push: debs/ + dists/stable/..."
