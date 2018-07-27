# DDC-CI-Brightness-MacOS
GUI brightness slider in Menu Bar to control backlight of external displays via DDC/CI.

Based on [ddcctl for OSX commandline](https://github.com/kfix/ddcctl) (credit: kfix)

## Usage
1. Make and install ddcctl command line (master branch included in this repo as well).
2. Build Xcode Project (See Note 2)

### Note 1
DDC/CI is very loosely implemented by manufacturers. There is no gurantee that this software will work on all monitors in its full capability.
In my personal experience, the monitor did not respond to consecutive commands well, so you'll notice the Xcode project sends the same command multiple times (Make-shift workaround for the issue). You may edit the source of ddcctl and recompile the binary to match your monitor's signaling if you wish to take the long route.

### Note 2
The Xcode Project attached here and the .app file assume your ddcctl is present in `/usr/local/bin` and is renamed to <b>ddc</b>. Therefore, your compiled binary must be as `/usr/local/bin/ddc`. 
You may either rename your compiled <b>ddcctl</b> binary or make the changes in <b>DDC Brightness/DDC Brightness/AppDelegate.swift</b>

### Note 3
* Read ddcctl man page before making changes to Xcode project. `ddcctl -h` or `ddc -h`
* Xcode Project is configured for display #1. Modify as per your needs.
* Command is repeated multiple times in Xcode Project (See Note 1). Experiment in teriminal and make changes accordingly, depending on your monitor's implementation.
* OSD capability can be added via xfix's repo. Modification of Xcode project necessary. Read wiki at xfix's repo for usage.
