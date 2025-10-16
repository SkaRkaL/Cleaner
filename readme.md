# Cleaner

A efficient system cleaning utility for macOS that helps manage disk space by removing unnecessary files and providing detailed space usage analysis.

## Features

- Automated cleanup of common system junk files
- Detailed space usage analysis with visual reporting
- Human-readable size formatting
- Configurable cleaning rules and safety measures
- Simple logging system
- Easy installation process

## Installation

1. Clone the repository:
```bash
git clone https://github.com/saifeddineelhanoune/Cleaner.git
cd Cleaner
```

2. Run the installer:
```bash
./CleanerInstaller.sh
```

3. Source your updated configuration:
```bash
source ~/.zshrc
```

The installer will:
- Create necessary directories
- Set up the required PATH
- Add the `sclean` command alias
- Configure permissions

## Usage

Simply run the cleaner using the installed alias:

```bash
sclean
```

The script will:
1. Display initial disk usage
2. Show space analysis for your home directory
3. Clean unnecessary files
4. Display final disk usage and space saved

## Configuration

You can customize the cleaning behavior by modifying `config.sh`:

- Set minimum file age for cleanup
- Configure minimum free space requirements
- Adjust maximum cache size
- Enable/disable backup before cleaning
- Customize logging preferences
- Configure safety measures
- Define excluded directories
- Set file age thresholds for different directories

## Safety Features

- Safe mode (optional) that asks for confirmation before deleting
- Maximum deletion size limit
- Excluded paths protection
- Logging of all operations

## Requirements

- macOS operating system
- Bash 3.2 or later
- ZSH shell (default on modern macOS)


## Author

Saif Eddine El Hanoune ([@saifeddineelhanoune](https://github.com/saifeddineelhanoune))
# trigger CI
