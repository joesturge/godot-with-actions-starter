# Godot With Actions Starter

## Overview

Welcome to the Godot With Actions Starter! This repository provides a template for creating games using the Godot game engine. It includes a set of essential files and directories to help you manage and develop your Godot project effectively.

## Godot support

Verified with `Godot 4.2.2-stable`.

### How to use template

To use this repository as a template for creating a new repository on GitHub, follow these steps:

1. Click on the "Use this template" button at the top of the repository page.
2. Choose a name for your new repository and select the desired visibility (public or private).
3. Click on the "Create repository from template" button.

Once the new repository is created, you can clone it to your local machine and start working on your project using the provided template files and directories.

### Project Files

Here are the important files and directories you'll find in this project:

- [.godot-version](.godot-version): This file specifies the version of Godot to use in GitHub Actions. Make sure you have the same version installed locally.
- [export-project.gd](export-project.gd): This script is responsible for applying version updates to the `project.godot` file and running the exports of the presets defined in `export_presets.cfg`
- [plug.gd](plug.gd): In this file, you can define the addons you want to use in your project. You can find more information about addons and how to use them [here](https://github.com/imjp94/gd-plug).
- [CHANGELOG.md](CHANGELOG.md): This file is automatically updated with release notes every time a new version is released. It helps you keep track of the changes made to your project over time.
- [.releaserc.json](.releaserc.json): This file contains the configuration for [semantic-release](https://github.com/semantic-release/semantic-release). Semantic release automates the versioning and release process based on your commit messages.
- [zip-exports.sh](zip-exports.sh)L This file is executed by `.releaserc.json` to zip the build exports into a single zip file.
- [test/ci/test_example.gd](test/ci/test_example.gd): This is an example test written using GdUnit4. Tests located under the `test/ci` directory will be executed in GitHub Actions. GdUnit4 is a testing framework for Godot that helps you ensure the quality of your code.
- [Scenes/Main/Main.tscn](Scenes/Main/Main.tscn): This is an example scene that renders the current version of your game. You can use this as a starting point to build your game's main scene.
- [.github/](.github/): This directory contains all the GitHub Actions workflows for your project. GitHub Actions allow you to automate various tasks and workflows in your development process.


These files and directories are essential for managing and developing your Godot project. Make sure to familiarize yourself with them as you work on your game.

### Semantic Versioning

Semantic versioning is enabled in the CI for this repository.

This repository follows a branching model with three main branches: `main`, `alpha`, and `beta`. Here's how to use them:

> ⚠️ **IMPORTANT**: Avoid **force pushing** to these branches as it may **BREAK** the semantic release process. ⚠️

- `main` branch: This branch represents the stable version of the project. It should only contain production-ready code. Pull requests should be opened against this branch for bug fixes and new features that are ready for release.

- `alpha` branch: This branch is used for early-stage development and testing. Pull requests should be opened against this branch for new features that are still in progress and need further testing.

- `beta` branch: This branch is used for feature freeze and final testing before a release. Pull requests should be opened against this branch for bug fixes and finalizing features.

When opening a pull request, make sure to select the appropriate target branch (`main`, `alpha`, or `beta`). Once the pull request is approved and passes all tests, it can be merged into the target branch.

Remember to follow the [conventional commits](https://www.conventionalcommits.org) format when writing commit messages to ensure accurate versioning and release tagging.

Every time you merge a PR into the main/alpha/beta branch, a new release could be created depending on the commit history. For example, the following commit messages will have the following effects:

- `feat: Add new feature XYZ` - This will create a minor release.
- `fix: Fix bug ABC` - This will create a patch release.
- `chore: Update dependencies` - This will not create a release.
- `docs: Update documentation` - This will not create a release.
- `refactor: Refactor code` - This will not create a release.
- `perf: Improve performance` - This will not create a release.

> Semantic Release always starts versions at `1.0.0`, it's just the way it works... see this [issue](https://github.com/semantic-release/semantic-release/issues/1507).

Merges into the main branch will produce a release tag such as `1.2.1`, while merges into the alpha/beta branch will produce a prerelease tag such as `1.2.1-alpha.3`.

### Build Assets

Every release comes with a `builds.zip`, it contains the builds for each platform as a zip. For example the web.zip can be uploaded to [itch.io](https://itch.io) as a HTML5 game.

## Development Setup

### Install Project

To set up your development environment, follow these steps:

1. Install the specific version of Godot specified in the [.godot-version](.godot-version) file.
2. Clone this repository to your local machine.
3. This repository uses [semantic-release](https://github.com/semantic-release/semantic-release) to manage versioning. Before committing any changes, make sure to follow the [conventional commits](https://www.conventionalcommits.org) format. To enforce this, run the following command:

```bash
curl -o- https://raw.githubusercontent.com/tapsellorg/conventional-commits-git-hook/master/scripts/install.sh | sh
```

4. Install the required plugins and addons by running the following command:

```bash
godot --headless -s plug.gd install
```

5. Open the project in Godot.
6. Run the unit tests using one of the following methods:
    a. Use [GdUnit4](https://mikeschulze.github.io/gdUnit4/) for a visual test runner.
    b. Run the following command from the command line:

```bash
godot -s --headless res://addons/gdUnit4/bin/GdUnitCmdTool.gd -a test/ci --ignoreHeadlessMode
```

7. To export the game (to web for example), run the following:

```bash
mkdir -p build
godot --export-release --headless "Web" "build/index.html"
```
