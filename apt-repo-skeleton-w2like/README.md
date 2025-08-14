# w2like-repo (APT repo)

This is the public APT repository for **W2Like (Virtual Camera)**.

## How to publish a new build
1. Put your `.deb` into `debs/`.
2. Build the package index:
   ```bash
   bash index.sh
   ```
3. Commit and push the updated files (including `dists/stable/.../Packages*`).

## Add this source in Sileo/Zebra
```
https://chigancc1.github.io/w2like-repo/
```
