# awakelion-xmake-repo
store all relevant public awakelion xmake-repositories for handy installation via `xmake`.
## How-To-Contribute
### packing rules
please refer to [xmake remote package generation docs](https://xmake.io/zh/guide/package-management/package-distribution.html#generate-remote-package).
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