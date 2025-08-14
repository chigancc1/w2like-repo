#!/usr/bin/env bash
set -euo pipefail
REPO_ROOT="$(pwd)/apt-repo"
mkdir -p "$REPO_ROOT/debs" "$REPO_ROOT/dists/stable/main/binary-iphoneos-arm64"
echo "Copy your .deb(s) into $REPO_ROOT/debs and run this again."
if compgen -G "$REPO_ROOT/debs/*.deb" > /dev/null; then
  dpkg-scanpackages -m "$REPO_ROOT/debs" > "$REPO_ROOT/dists/stable/main/binary-iphoneos-arm64/Packages"
  gzip -c "$REPO_ROOT/dists/stable/main/binary-iphoneos-arm64/Packages" > "$REPO_ROOT/dists/stable/main/binary-iphoneos-arm64/Packages.gz"
  cat > "$REPO_ROOT/dists/stable/Release" <<EOF
Origin: YourName
Label: YourName Repo
Suite: stable
Codename: stable
Architectures: iphoneos-arm64
Components: main
Description: Your iOS tweaks
EOF
  echo "Repo ready at $REPO_ROOT"
fi
