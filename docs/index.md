# Introduction

By default FLSun does not use builds from official GitHub repositories. Updates point to Gitee repositories which are very slow, sometimes inaccessible and not updated. In addition, during Delta Calibration, tower angles and delta radius are never recalculated in their Klipper build, which can cause several issues.

This documentation explains the whole process in order to obtain Root access on the Speeder Pad and to configure it correctly with optimized printer settings. In addition there is documentation for...

- Useful and automated macros with notifications to KlipperScreen
- Configuration for ADXL345
- Improved Start/End Gcodes
- And more...

Before using Klipper please read these documentations:

- [Klipper](https://www.klipper3d.org/) (Operating System)
- [Moonraker](https://moonraker.readthedocs.io/) (API Web Server)
- [Mainsail](https://docs.mainsail.xyz/) (Web Interface)
- [KlipperScreen](https://klipperscreen.readthedocs.io/) (Screen Interface)

To start, you need to [Re-install the Speedpad OS](reinstall/prerequisites.md).