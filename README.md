# Inno Setup Cross

Cross-compile InnoSetup installers using Wine on an Ubuntu runner.

This action is adapted from https://github.com/amake/innosetup-docker/. Due to the extra overhead of spinning up a new Docker container each time and flaky behaviour with `docker run` in Gitea Actions, it was more straightforward to extract the contents of the container to the GitHub Actions format.

The action does not support Windows or MacOS runners at present, and there are no plans to add support.


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

The compiled installer binaries will be located at `$PWD/Output/[OutputBaseFilename].exe`, where `[OutputBaseFilename]` is a key in the InnoSetup installer configuration.

## Inputs

```yaml
inputs:
  filename:
    description: The .iss setup file to be compiled
    required: true
```
