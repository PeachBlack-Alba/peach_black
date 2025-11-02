# DOOM Setup Instructions

This folder should contain the `doom.jsdos` bundle file for the DOOM game to work.

## How to Get DOOM .jsdos Bundle

### Option 1: Use js-dos.com Bundle Creator
1. Visit https://dos.zone/studio/
2. Upload DOOM shareware WAD file (legally available from id Software)
3. Configure DOSBox settings
4. Generate and download the `.jsdos` bundle
5. Place it in this directory as `doom.jsdos`

### Option 2: Download Pre-made Bundle
1. Find a legal DOOM shareware bundle online
2. Download the `.jsdos` file
3. Rename it to `doom.jsdos` if needed
4. Place it in this directory

### Option 3: Create Your Own
Using js-dos CLI tool:
```bash
npm install -g js-dos
jsdos bundle DOOM/ -o doom.jsdos
```

## File Structure
```
web/
├── doom.html          (HTML page with js-dos integration)
└── doom/
    ├── README.md      (this file)
    └── doom.jsdos     (DOOM game bundle - YOU NEED TO ADD THIS)
```

## Legal Note
DOOM Shareware is freely distributable. The full commercial version of DOOM requires a license from id Software/Bethesda.

## Alternative
If you don't have a DOOM bundle, the system will show an error message with instructions.

## Testing
1. Place `doom.jsdos` in this folder
2. Run `flutter run -d chrome`
3. Click the DOOM icon on the desktop
4. Game should load after clicking on the canvas

