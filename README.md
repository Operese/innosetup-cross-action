# Inno Setup Cross Action

Cross-compile InnoSetup installers using Wine on Ubuntu.

## Usage

```yaml
name: Release
on:
 push:
  tags:
   - '**[0-9]+.[0-9]+.[0-9]+*'

jobs:
  installer:
    runs-on: ubuntu-latest
    steps:
      - name: Build Installer
        uses: Operese/innosetup-cross-action@v1
        with:
          filename: InstallerConfig.iss
```

### Inputs

```yaml
inputs:
  filename:
    description: The .iss setup file to be compiled
    required: true
```