# Laptop Power Alarm


This is a simple alarm system that alerts you if your laptop is unplugged.


## Features
- Works on Linux and macOS
- Speaks a warning message when unplugged
- Keeps laptop awake on Linux using `systemd-inhibit`
- Automatically checks and installs dependencies on Linux and macOS


## Usage
1. Clone the repository:
```
git clone <your_repo_url>
cd Laptop-Power-Alarm
```
2. Run the alarm:
```
make run
```

The Makefile will automatically check for and install any missing dependencies:
- On Linux: `acpi` and `speech-dispatcher` (for `spd-say`)
- On macOS: `pmset` and `say`

The alarm will keep running until you stop it (Ctrl+C). On Linux, it will prevent the laptop from sleeping while the script is active.

## Notes
- macOS uses `say` for voice alerts. The Makefile will install it via Homebrew if missing.
- Linux uses `spd-say` and `acpi`. The Makefile will install them via apt if missing.
- Make sure your BIOS/system settings allow inhibit sleep on lid close for Linux.
- On macOS, Homebrew is required for automatic installation. If you don't have Homebrew, install it from https://brew.sh/