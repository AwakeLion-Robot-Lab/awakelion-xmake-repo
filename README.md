# awakelion-xmake-repo

store all relevant public awakelion xmake-repositories for handy installation via `xmake`.

## How-To-Contribute

### packing rules

#### STEP 1: generate remote package

please refer to [xmake remote package generation docs](https://xmake.io/zh/guide/package-management/package-distribution.html#generate-remote-package).

#### STEP 2: local test

I already configured relevant test scripts from [xmake-repo](https://github.com/xmake-io/xmake-repo/tree/dev/scripts) completely, so just refer to [xmake remote package local test docs](https://xmake.io/zh/guide/package-management/package-distribution.html#local-test).

#### STEP 3: commit and push

specific commit patterns are on below for tidy.

### commit message pattern

if the pull request is a update:
```
"update `{$REPO_NAME}`, from `v{$MAJOR}.{$MINOR}.{$PATCH}` to `v{$MAJOR}.{$MINOR}.{$PATCH}`."
# for example:
"update `awakelion-logger`, from `v1.0.0` to `v1.0.1`."
```

if the pull request add a brand-new repository:
```
"add `{$REPO_NAME}`, inital version is `v{$MAJOR}.{$MINOR}.{$PATCH}`."
# for example:
"add `awakelion-viewer`, initial version is `v1.0.0`."
```

if you only want to refine `xmake.lua` of remote package:
```
"refine `{$REPO_NAME}`, which version is `v{$MAJOR}.{$MINOR}.{$PATCH}`."
# for example:
"refine `awakelion-viewer`, which version is `v1.0.2`."
```