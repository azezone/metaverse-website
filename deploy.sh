#!/bin/bash

# 元次元公司主页部署脚本

echo "🎮 开始部署元次元3D二次元社交平台主页..."
echo "=" * 60

# 检查必要文件
if [ ! -f "index.html" ]; then
    echo "❌ 错误：找不到 index.html 文件"
    exit 1
fi

# 创建.gitignore
cat > .gitignore << 'EOF'
# 忽略文件
.DS_Store
node_modules/
*.log
.env
*.tmp
*.bak
Thumbs.db

# 构建文件
dist/
build/

# 编辑器文件
.vscode/
.idea/
*.swp
*.swo
EOF

echo "✅ .gitignore 文件已创建"

# 创建部署说明
cat > DEPLOYMENT.md << 'EOF'
# 元次元主页部署指南

## 🎯 项目概述
这是一个3D二次元虚拟社交平台的公司主页，展示产品特色、虚拟世界和创作者社区。

## 🚀 快速部署

### 方法一：GitHub Pages（推荐）
**步骤：**
1. 在GitHub创建新仓库：`metaverse-website`
2. 初始化本地仓库：
   ```bash
   git init
   git add .
   git commit -m "初始提交：元次元3D二次元社交平台"
   git branch -M main
   git remote add origin https://github.com/你的用户名/metaverse-website.git
   git push -u origin main
   ```
3. 启用GitHub Pages：
   - 进入仓库设置 → Pages
   - 分支选择：`main`
   - 文件夹选择：`/(root)`
   - 点击保存

4. 访问地址：
   - https://你的用户名.github.io/metaverse-website/

### 方法二：Vercel（最快速）
1. 访问 https://vercel.com
2. 导入GitHub仓库
3. 自动部署，获得：metaverse-website.vercel.app

### 方法三：Netlify
1. 访问 https://netlify.com
2. 拖拽项目文件夹上传
3. 获得：metaverse-website.netlify.app

## 🌐 自定义域名

### 配置步骤：
1. 购买域名（如 metaverse.acg）
2. 在DNS提供商处添加CNAME记录：
   ```
   www.metaverse.acg CNAME 你的用户名.github.io
   ```
3. 在GitHub Pages设置中配置自定义域名

### 推荐域名：
- metaverse.acg
- 3d-acg.com  
- virtual-anime.com
- anime-social.world

## 🎨 自定义修改

### 1. 修改品牌信息
- 编辑 `index.html` 中的公司名称和标语
- 更新联系方式
- 调整社交媒体链接

### 2. 调整视觉风格
修改CSS变量（在文件顶部）：
```css
:root {
    --primary: #ff6b9d;      /* 主色调 */
    --secondary: #8a2be2;    /* 次要色调 */
    --accent: #00d4ff;       /* 强调色 */
    --dark: #1a1a2e;         /* 深色背景 */
}
```

### 3. 添加新内容
- 在相应区域添加新的功能卡片
- 保持现有的CSS类名确保风格一致
- 添加对应的JavaScript交互

## 📱 移动端优化

### 已实现：
- 响应式布局
- 触摸友好的交互
- 移动端导航菜单

### 建议优化：
1. 测试不同尺寸的设备
2. 优化图片加载
3. 减少移动端动画复杂度

## 🔧 技术维护

### 定期更新：
1. 检查链接有效性
2. 更新联系方式
3. 优化页面性能
4. 添加新功能模块

### 性能监控：
1. 使用Google PageSpeed Insights
2. 监控页面加载时间
3. 优化资源加载

## 📊 数据分析

### 建议集成：
1. **Google Analytics**：用户行为分析
2. **Hotjar**：用户热力图
3. **Mixpanel**：产品分析
4. **Clarity**：用户会话录制

### 关键指标：
- 页面浏览量
- 用户停留时间
- 转化率（注册/下载）
- 用户来源渠道

## 🛡️ 安全考虑

### 基本安全：
1. 使用HTTPS
2. 防止XSS攻击
3. 内容安全策略
4. 定期安全扫描

### 隐私保护：
1. GDPR合规
2. 用户数据保护
3. Cookie政策
4. 隐私政策页面

## 📞 技术支持

### 遇到问题：
1. 检查浏览器控制台错误
2. 验证HTML/CSS有效性
3. 测试不同网络环境

### 获取帮助：
- 邮箱：contact@metaverse.acg
- 电话：400-ACG-8888
- 工作时间：周一至周五 9:00-18:00

## 🎉 上线检查清单

- [ ] 所有链接正常工作
- [ ] 移动端适配良好
- [ ] 页面加载速度优化
- [ ] SEO元标签完善
- [ ] 联系表单测试
- [ ] 跨浏览器测试
- [ ] 性能监控配置
- [ ] 备份策略制定

---

**让虚拟世界，连接真实情感。**
EOF

echo "✅ DEPLOYMENT.md 文件已创建"

# 创建预览脚本
cat > preview.py << 'EOF'
#!/usr/bin/env python3
"""
元次元主页预览服务器
运行后访问 http://localhost:8888 查看效果
"""

import http.server
import socketserver
import webbrowser
import os
import sys

PORT = 8888

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=os.path.dirname(__file__), **kwargs)
    
    def log_message(self, format, *args):
        # 减少日志输出
        pass

def main():
    print("🎮 启动元次元3D二次元社交平台预览")
    print("=" * 60)
    print("🏢 公司名称: 元次元科技有限公司")
    print("🎯 产品定位: 3D二次元虚拟社交平台")
    print("🎨 设计风格: 二次元美学 + 赛博朋克")
    print("🌐 访问地址: http://localhost:8888")
    print("=" * 60)
    print("\n✨ 特色功能:")
    print("  ✅ 动态粒子背景效果")
    print("  ✅ 3D卡片悬停交互")
    print("  ✅ 霓虹光效设计元素")
    print("  ✅ 响应式移动端适配")
    print("  ✅ 平滑滚动导航")
    print("\n📱 核心展示:")
    print("  • 虚拟形象系统")
    print("  • 开放世界探索")
    print("  • 实时社交互动")
    print("  • 创作者经济")
    
    # 尝试自动打开浏览器
    try:
        webbrowser.open(f'http://localhost:{PORT}')
        print("\n🌐 正在打开浏览器...")
    except:
        print("\n📱 请在浏览器中手动访问: http://localhost:8888")
    
    print("\n🛑 按 Ctrl+C 停止服务器")
    print("=" * 60)
    
    try:
        with socketserver.TCPServer(("", PORT), Handler) as httpd:
            httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n👋 服务器已停止")
    except OSError as e:
        if e.errno == 98:  # Address already in use
            print(f"\n❌ 端口 {PORT} 已被占用")
            print(f"   请修改 preview.py 中的 PORT 变量")
            print(f"   或直接双击打开 index.html 文件")
        else:
            raise

if __name__ == "__main__":
    main()
EOF

chmod +x preview.py
echo "✅ preview.py 预览脚本已创建"

echo ""
echo "🎉 项目文件准备完成！"
echo ""
echo "📁 项目结构："
echo "  ├── index.html      # 主页文件（二次元3D风格）"
echo "  ├── README.md       # 项目详细说明"
echo "  ├── DEPLOYMENT.md   # 部署指南"
echo "  ├── deploy.sh       # 部署脚本"
echo "  └── preview.py      # 预览服务器"
echo ""
echo "🚀 立即操作："
echo "1. 运行预览： python3 preview.py"
echo "2. 访问 http://localhost:8888 查看效果"
echo "3. 按照 DEPLOYMENT.md 部署到线上"
echo ""
echo "💖 特色亮点："
echo "  • 二次元美学设计"
echo "  • 3D交互效果"
echo "  • 虚拟社交功能展示"
echo "  • 创作者社区支持"
echo ""
echo "=" * 60