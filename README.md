# Contextual.io Homebrew Tap

Homebrew casks for Contextual.io desktop apps.

## Install

```sh
brew install --cask contextualio/tap/ctxl-tool
```

…or tap first, then install by short name:

```sh
brew tap contextualio/tap
brew install --cask ctxl-tool
```

## Available apps

| Cask        | App       | Description                     |
| ----------- | --------- | ------------------------------- |
| `ctxl-tool` | Ctxl Tool | Companion app for the ctxl CLI  |

Apps update themselves after install; `brew upgrade` won't manage them
(`auto_updates true`). To remove an app and its data: `brew uninstall --zap --cask ctxl-tool`.
