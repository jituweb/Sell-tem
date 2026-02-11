<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shadowrocket 使用教程 &mdash; {$config["appName"]}</title>
    <link href="{$metron['assets_url']}/css/client/metron-icon.css" rel="stylesheet" type="text/css" />
    <link href="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.css" rel="stylesheet">
    {include file='include/global/head.tpl'}
</head>

<body>
<div class="d-flex flex-column flex-root">
    <div class="d-flex flex-row flex-column-fluid page">
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
            {include file='include/global/menu.tpl'}

            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="subheader min-h-lg-175px pt-5 pb-7 subheader-transparent" id="kt_subheader">
                    <div class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                        <div class="d-flex align-items-center flex-wrap mr-2">
                            <div class="d-flex flex-column">
                                <h2 class="text-white font-weight-bold my-2 mr-5">Shadowrocket 使用教程</h2>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                    <div class="card-body">

                                        <!-- ✅ 0. 简介 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">0. 简介</p>
                                                <div class="example-preview">
                                                    <p>Shadowrocket是一款基于规则的网络调试工具，性能高、稳定好、功能丰富，占用资源少，能全盘接管系统连接并根据规则处理。</p>
                                                    <p>由于中国区 App Store 禁止上架 VPN 类软件，Shadowrocket 仅在美区、港区等非国区上架，且为付费软件。</p>
                                                    {if $metron['ios_account'] != ''}
                                                    <p>本站为符合要求的会员提供共享 Apple ID 下载渠道。建议有条件的用户注册非国区 Apple ID 支持开发者。</p>
                                                    {/if}
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/ios/shadowrocket/shadowrocket.jpg" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/ios/shadowrocket/shadowrocket.jpg"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- ✅ 1. 安装客户端 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">1. 通过 App Store 安装客户端</p>

                                                {if $metron['ios_account'] != ''}
                                                {if $user->class >= $metron['ios_class'] && $user->class != 10}

                                                <div class="input-group mb-3 col-lg-8">
                                                    <input type="text" class="form-control" value="{$metron['ios_account0']}" disabled>
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary copy-text" type="button" data-clipboard-text="{$metron['ios_account0']}">复制账号</button>
                                                    </div>
                                                </div>
                                                <div class="input-group mb-3 col-lg-8">
                                                    <input type="text" class="form-control" value="{$metron['ios_password0']}" disabled>
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary copy-text" type="button" data-clipboard-text="{$metron['ios_password0']}">复制密码</button>
                                                    </div>
                                                </div>
                                                <br/>

                                                <div class="input-group mb-3 col-lg-8">
                                                    <input type="text" class="form-control" value="{$metron['ios_account1']}" disabled>
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary copy-text" type="button" data-clipboard-text="{$metron['ios_account1']}">复制账号</button>
                                                    </div>
                                                </div>
                                                <div class="input-group mb-3 col-lg-8">
                                                    <input type="text" class="form-control" value="{$metron['ios_password1']}" disabled>
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary copy-text" type="button" data-clipboard-text="{$metron['ios_password1']}">复制密码</button>
                                                    </div>
                                                </div>

                                                <h6>
                                                    <button id="refreshButton" class="refresh-btn" onClick="location.reload();">获取最新密码</button>
                                                    <button class="btn btn-direct-download" onclick="switchToUSAppStore();">直达 AppStore 下载</button>
                                                    <br><br>
                                                    「双重认证问题」点击「其他选项」并点击「不要升级」请勿点击「继续」<br><br>
                                                    <strong>切勿在手机设置里登录本站账号，下载完必须立刻退出。</strong>
                                                </h6>

                                                {else}
                                                <div class="alert alert-custom alert-outline-primary fade show mb-5" role="alert">
                                                    <div class="alert-icon"><i class="flaticon-warning"></i></div>
                                                    <div class="alert-text">
                                                        <h4>您的等级不支持查看共享账号</h4>
                                                        <p>共享账号仅对 <code>Lv.{$metron['ios_class']}及以上会员</code> 提供。</p>
                                                    </div>
                                                </div>
                                                {/if}
                                                {else}
                                                <div class="alert alert-custom alert-outline-primary fade show mb-5" role="alert">
                                                    <div class="alert-icon"><i class="flaticon-warning"></i></div>
                                                    <div class="alert-text">
                                                        <h4>您需要持有非国区 Apple ID</h4>
                                                        <p>Shadowrocket 为付费软件，需使用非中国区 Apple ID 下载。</p>
                                                    </div>
                                                </div>
                                                {/if}

                                                <p class="mb-2">打开 <code>App Store</code>，使用共享账号登录后搜索 <code>Shadowrocket</code> 安装。</p>
                                                <p class="mb-2">安装完成后请立即退出账号。</p>
                                            </div>

                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="/theme/metron/images/ios_01.png" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="/theme/metron/images/ios_01.png"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- ✅ 2. 设置订阅 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">2. 设置订阅地址</p>
                                                <div class="btn-group mb-3 mr-3">
                                                    <button type="button" class="btn btn-pill btn-shadowrocket dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        &nbsp;&nbsp;<i class="metron-shadowrocket text-white"></i>Shadowrocket 订阅&nbsp;&nbsp;
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["shadowrocket"]}">复制 Shadowrocket 订阅</button>
                                                        <div class="dropdown-divider"></div>
                                                        <button type="button" class="dropdown-item" onclick="importSublink('shadowrocket')">一键导入 Shadowrocket</button>
                                                    </div>
                                                </div>

                                                <p>点击上方按钮导入节点配置到 Shadowrocket。</p>
                                                <div class="alert alert-custom alert-outline-primary fade show mb-5" role="alert">
                                                    <div class="alert-icon"><i class="flaticon-warning"></i></div>
                                                    <div class="alert-text">
                                                        <p>无法一键导入？请手动添加订阅：</p>
                                                        <ul>
                                                            <li>APP 首页 → 点击右上角 <code>+</code></li>
                                                            <li>类型选择 <code>Subscribe</code></li>
                                                            <li>粘贴订阅地址到 URL 栏</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/ios/shadowrocket/02.png" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/ios/shadowrocket/02.png"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- ✅ 3. 开启代理 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">3. 开启代理</p>
                                                <p>回到首页 → 进入 <code>全局路由</code> → 改为 <code>配置</code></p>
                                                <p>选择节点（黄色小点为当前节点）</p>
                                                <p>点击顶部开关开启代理，首次使用请允许 VPN 授权。</p>
                                            </div>
                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/ios/shadowrocket/04.png" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/ios/shadowrocket/04.png"/>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {include file='include/global/footer.tpl'}
        </div>
    </div>
</div>

<!-- ✅ 样式增强 -->
<style>
/* 标题视觉优化 */
.tutorial-section-title {
  font-size: 1.8rem;
  font-weight: 700;
  color: #2f80ed;
  border-left: 6px solid #2f80ed;
  padding-left: 10px;
  margin-bottom: 25px;
}

/* 内容排版 */
.card-body {
  font-family: "Microsoft YaHei", sans-serif;
  font-size: 16px;
  line-height: 1.8;
  color: #333;
}

/* 图片悬停效果 */
img.rounded-lg {
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  transition: all 0.3s ease;
}
img.rounded-lg:hover {
  transform: scale(1.02);
  box-shadow: 0 8px 18px rgba(0,0,0,0.25);
}

/* code 样式 */
code {
  background: rgba(47,128,237,0.1);
  color: #2f80ed;
  padding: 2px 6px;
  border-radius: 4px;
}

/* 提示块柔化 */
.alert-custom {
  border-radius: 10px;
  border: 1px solid rgba(47,128,237,0.2);
  background: rgba(47,128,237,0.05);
}

/* 刷新按钮 */
.refresh-btn {
  background: linear-gradient(45deg, #4caf50, #81c784);
  color: white;
  border: none;
  padding: 12px 20px;
  font-size: 16px;
  border-radius: 8px;
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}
.refresh-btn:hover {
  background: linear-gradient(45deg, #388e3c, #66bb6a);
  transform: scale(1.05);
  box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
}
.refresh-btn:active {
  transform: scale(0.95);
}
.refresh-btn::after {
  content: "⟳";
  margin-left: 8px;
  transition: transform 0.3s ease;
}
.refresh-btn:active::after {
  transform: rotate(360deg);
}

/* 直达下载按钮 */
.btn-direct-download {
  background: linear-gradient(45deg, #ff6b6b, #ee5a6f);
  color: white !important;
  border: none;
  padding: 12px 20px;
  font-size: 16px;
  border-radius: 8px;
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  margin-left: 10px;
  text-decoration: none !important;
  display: inline-block;
}
.btn-direct-download:hover {
  background: linear-gradient(45deg, #ff5252, #e63946);
  transform: scale(1.05);
  box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
  color: white !important;
}
.btn-direct-download:active {
  transform: scale(0.95);
}

/* 返回顶部按钮 */
#backToTop {
  position: fixed;
  bottom: 40px;
  right: 30px;
  display: none;
  background: #2f80ed;
  color: #fff;
  border: none;
  padding: 10px 14px;
  border-radius: 50%;
  font-size: 20px;
  cursor: pointer;
  box-shadow: 0 4px 8px rgba(0,0,0,0.2);
  transition: all 0.3s ease;
}
#backToTop:hover {
  background: #1c5dd6;
  transform: scale(1.1);
}

/* 切换美区 AppStore 指南样式 */
.switch-guide-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
  animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.switch-guide-modal {
  background: white;
  border-radius: 12px;
  width: 90%;
  max-width: 500px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  animation: slideUp 0.3s ease;
}

@keyframes slideUp {
  from {
    transform: translateY(20px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

.switch-guide-header {
  background: linear-gradient(45deg, #2f80ed, #1c5dd6);
  color: white;
  padding: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.switch-guide-header h3 {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
}

.switch-guide-close {
  background: none;
  border: none;
  color: white;
  font-size: 28px;
  cursor: pointer;
  padding: 0;
  width: 30px;
  height: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.switch-guide-close:hover {
  opacity: 0.8;
}

.switch-guide-content {
  padding: 25px;
  color: #333;
  line-height: 1.8;
}

.switch-guide-content p {
  margin: 10px 0;
}

.guide-steps {
  background: rgba(47, 128, 237, 0.08);
  padding: 15px 25px;
  border-radius: 8px;
  border-left: 4px solid #2f80ed;
  margin: 15px 0;
}

.guide-steps li {
  margin: 8px 0;
  font-size: 15px;
}

.guide-steps strong {
  color: #2f80ed;
}

.guide-tips {
  background: rgba(255, 180, 0, 0.1);
  padding: 12px 15px;
  border-radius: 8px;
  border-left: 4px solid #ffa500;
  margin-top: 15px;
  font-size: 14px;
}
</style>

<!-- ✅ 返回顶部按钮 -->
<button id="backToTop" title="返回顶部">↑</button>
<script>
window.onscroll = function() {
  document.getElementById("backToTop").style.display = window.scrollY > 400 ? "block" : "none";
};
document.getElementById("backToTop").onclick = function() {
  window.scrollTo({ top: 0, behavior: "smooth" });
};

// ✅ 自动切换到美区 AppStore 功能
function switchToUSAppStore() {
  // 检测是否为 iOS 设备
  const isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent);
  
  if (isIOS) {
    // iOS 设备：检测当前 AppStore 区域
    const currentCountry = localStorage.getItem('appStoreCountry') || 'CN';
    
    if (currentCountry !== 'US') {
      // 需要切换到美区
      showSwitchGuide();
    } else {
      // 已在美区，直接打开下载链接
      window.location.href = 'https://apps.apple.com/us/app/shadowrocket/id932747118?l=zh-Hans-CN';
    }
  } else {
    // 非 iOS 设备：直接打开链接
    window.location.href = 'https://apps.apple.com/us/app/shadowrocket/id932747118?l=zh-Hans-CN';
  }
}

// 显示切换指南
function showSwitchGuide() {
  const guideHTML = `
    <div class="switch-guide-overlay" id="switchGuideOverlay">
      <div class="switch-guide-modal">
        <div class="switch-guide-header">
          <h3>切换到美区 AppStore</h3>
          <button class="switch-guide-close" onclick="closeSwitchGuide();">×</button>
        </div>
        <div class="switch-guide-content">
          <p><strong>您当前未在美区 AppStore，请按以下步骤切换：</strong></p>
          <ol class="guide-steps">
            <li>登陆教程里面美区ID下载</li>
            <li>点击教程第一步图片查看详细方法</strong></li>

          </ol>
          <p class="guide-tips">💡 <strong>提示：</strong>已有美区账号，点击下方按钮直接跳转AppStore</p>
          <button class="btn btn-direct-download" style="width: 100%; margin-top: 15px;" onclick="directToAppStore();">
            已切换，立即下载
          </button>
        </div>
      </div>
    </div>
  `;
  
  document.body.insertAdjacentHTML('beforeend', guideHTML);
}

// 关闭切换指南
function closeSwitchGuide() {
  const overlay = document.getElementById('switchGuideOverlay');
  if (overlay) {
    overlay.remove();
  }
}

// 直接跳转 AppStore
function directToAppStore() {
  localStorage.setItem('appStoreCountry', 'US');
  window.location.href = 'https://apps.apple.com/us/app/shadowrocket/id932747118?l=zh-Hans-CN';
  closeSwitchGuide();
}
</script>

{include file='include/global/scripts.tpl'}
{include file='include/global/import_sublink.tpl'}
<script src="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.js"></script>
</body>
</html>