<!DOCTYPE html>
<html lang="en">
<head>
    <title>Clash 使用教程 &mdash; {$config["appName"]}</title>
    <link href="{$metron['assets_url']}/css/client/metron-icon.css" rel="stylesheet" type="text/css" />
    <link href="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.css" rel="stylesheet">
    {include file='include/global/head.tpl'}
    <style>
        /* ====== 教程页面视觉优化 ====== */
        .tutorial-section-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #2f80ed;
            border-left: 6px solid #2f80ed;
            padding-left: 10px;
            margin-bottom: 25px;
        }

        .card-body {
            font-family: "Microsoft YaHei", sans-serif;
            font-size: 16px;
            line-height: 1.8;
            color: #333;
        }

        .alert-custom {
            border-radius: 10px;
            border: 1px solid rgba(47,128,237,0.2);
            background: rgba(47,128,237,0.05);
        }
        .alert-custom .alert-icon {
            color: #2f80ed;
        }

        img.rounded-lg {
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            transition: all 0.3s ease;
        }
        img.rounded-lg:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 18px rgba(0,0,0,0.25);
        }

        .btn-clash {
            background: linear-gradient(45deg, #2f80ed, #56ccf2);
            color: white !important;
            transition: all 0.3s ease;
        }
        .btn-clash:hover {
            background: linear-gradient(45deg, #1c5dd6, #45aee0);
            transform: translateY(-2px);
        }

        code {
            background: rgba(47,128,237,0.1);
            color: #2f80ed;
            padding: 2px 6px;
            border-radius: 4px;
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
            z-index: 999;
        }
        #backToTop:hover {
            background: #1c5dd6;
            transform: scale(1.1);
        }
    </style>
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
                                <h2 class="text-white font-weight-bold my-2 mr-5">Clash for Mac 使用教程</h2>
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

                                        <!-- 0. 简介 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">0. 简介</p>
                                                <p><code>Clash</code> 是一款跨平台代理工具，支持 Linux/MacOS/Windows/Android，基于规则分流系统（类似 Surge）。</p>
                                                {if $metron['dw_mac_clashr'] != ''}
                                                <p>本页面提供的 <code>Clash(R)</code> 基于 <code>Clash</code> 开发，可支持 SSR 节点。</p>
                                                <p>可同时支持 {$config["appName"]} 提供的 SSR 与 V2Ray 节点。</p>
                                                {/if}
                                                <p>由于客户端长期更新，界面或功能可能略有不同，请以实际操作为准。</p>
                                            </div>
                                            <div class="col-lg-5">
                                                <a href="{$metron['assets_url']}/media/tutorial/mac/clashr/clashr.png" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/mac/clashr/clashr.png"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 1. 下载与安装 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">1. 下载安装客户端</p>
                                                <a href="https://45.62.102.54:12598/jitu/ClashXPro.dmg" class="btn btn-pill btn-clash mb-4">
                                                    <i class="metron-clash text-white"></i>&nbsp;下载 Clash 客户端
                                                </a>
                                                <p>下载后拖动安装至应用程序文件夹，在启动台中打开，若弹出安全提示，请点击“确定”，输入系统密码。</p>
                                                <p>如提示“无法打开，因为无法验证开发者”，请参考以下解决方案：</p>
                                                <a href="https://developer.aliyun.com/article/1130752" class="btn btn-pill btn-clash mb-4" target="_blank">
                                                    查看教程
                                                </a>
                                            </div>
                                            <div class="col-lg-5">
                                                <a href="{$metron['assets_url']}/media/tutorial/mac/clashr/01.png" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/mac/clashr/01.png"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 2. 设置订阅 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">2. 设置订阅地址</p>
                                                {if in_array('clash',$metron['index_sub'])}
                                                <div class="btn-group mb-3 mr-3">
                                                    <button type="button" class="btn btn-pill btn-clash dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <i class="metron-clash text-white"></i>&nbsp;Clash 订阅配置
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["clash"]}">复制 Clash 订阅</button>
                                                        <div class="dropdown-divider"></div>
                                                        <button type="button" class="dropdown-item" onclick="importSublink('clash')">一键导入 Clash</button>
                                                    </div>
                                                </div>
                                                {/if}

                                                <p>点击上方按钮导入节点配置，Config Name 填入 {$config["appName"]}。</p>
                                                <p>若出现配置错误，请重启 Clash 后重试（确保已购买套餐）。</p>

                                                <div class="alert alert-custom fade show mb-5" role="alert">
                                                    <div class="alert-icon">
                                                        <i class="flaticon-warning"></i>
                                                    </div>
                                                    <div class="alert-text">
                                                        <p>无法一键导入？可手动添加：</p>
                                                        <p>依次点击 <code>配置</code> → <code>托管配置</code> → <code>管理</code> → <code>添加</code></p>
                                                        <p>将订阅地址粘贴至 URL 一栏，Config Name 填入 {$config["appName"]} 后确定。</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <a href="{$metron['assets_url']}/media/tutorial/mac/clashr/02.png" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/mac/clashr/02.png"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 3. 开启代理 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">3. 开启代理</p>
                                                <p>点击勾选 <code>设置为系统代理</code> 即可开启。</p>
                                            </div>
                                            <div class="col-lg-5">
                                                <a href="{$metron['assets_url']}/media/tutorial/mac/clashr/03.png" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/mac/clashr/03.png"/>
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

<button id="backToTop" title="返回顶部">↑</button>

{include file='include/global/scripts.tpl'}
{include file='include/global/import_sublink.tpl'}
<script src="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.js" type="text/javascript"></script>
<script>
window.onscroll = function() {
  document.getElementById("backToTop").style.display = window.scrollY > 400 ? "block" : "none";
};
document.getElementById("backToTop").onclick = function() {
  window.scrollTo({ top: 0, behavior: "smooth" });
};
</script>
</body>
</html>
