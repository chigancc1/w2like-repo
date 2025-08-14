# W2Like (Virtual Camera) — skeleton

**Targets:** Instagram, TikTok, Facebook, and the stock Camera app (overlay mode).
- True feed replacement via `AVCaptureVideoDataOutput` delegate proxy.
- Optional **overlay-only** mode (useful for the stock Camera preview).

## Build (rootless Theos)
```bash
export THEOS=/var/theos
make package
# install to device:
make install
```
If process names differ on your device, edit `INSTALL_TARGET_PROCESSES` in `tweak/W2Like/Makefile`.
Common names:
- Instagram (`Instagram`)
- TikTok (`TikTok` or `Musically` on some regions)
- Facebook (`Facebook`)
- Camera (`Camera`)

## Video path
Default: `/var/mobile/Media/W2Like/clip.mp4` (create the folder and copy your video there).

## Preferences
Settings → W2Like
- Enable
- Camera overlay mode (on for stock Camera to fake preview)
- Video path
- Target apps (multi-select)

## Notes
- Not all apps use the same capture pipeline; this proxy targets AVFoundation standard paths. Some updates may change internals.
- The overlay mode only affects what you **see**; recordings may still use the real camera in the stock Camera app.
- Respect platform rules and local laws.
