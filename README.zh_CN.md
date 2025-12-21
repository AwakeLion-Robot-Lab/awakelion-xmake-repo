# awakelion-xmake-repo

收录所有相关的与`Awakelion实验室`的公开`xmake repo`，以便通过 `xmake` 包管理器快速安装。

## 如何贡献

### 打包规则

#### 第一步：生成远程包

请参考 [xmake 远程包生成文档](https://xmake.io/zh/guide/package-management/package-distribution.html#generate-remote-package)。

#### 第二步：本地测试

我已经完整配置了来自 [xmake-repo](https://github.com/xmake-io/xmake-repo/tree/dev/scripts) 的相关测试脚本，因此请直接参考 [xmake 远程包本地测试文档](https://xmake.io/zh/guide/package-management/package-distribution.html#local-test)。

#### 第三步：提交与推送

为了保持记录整洁，请遵循以下特定的提交格式。

### 提交信息格式

如果该 Pull Request 是**更新**操作：
```
"update `{$REPO_NAME}`, from `v{$MAJOR}.{$MINOR}.{$PATCH}` to `v{$MAJOR}.{$MINOR}.{$PATCH}`."
# 例如：
"update `awakelion-logger`, from `v1.0.0` to `v1.0.1`."
```

如果该 Pull Request 是**添加全新仓库**：
```
"add `{$REPO_NAME}`, inital version is `v{$MAJOR}.{$MINOR}.{$PATCH}`."
# 例如：
"add `awakelion-viewer`, initial version is `v1.0.0`."
```

如果你只是想**优化/修改**远程包的 `xmake.lua` 配置：
```
"refine `{$REPO_NAME}`, which version is `v{$MAJOR}.{$MINOR}.{$PATCH}`."
# 例如：
"refine `awakelion-viewer`, which version is `v1.0.2`."
```