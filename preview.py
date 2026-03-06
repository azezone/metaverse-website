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

PORT = 8900

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
