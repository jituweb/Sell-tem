<!DOCTYPE html>
<html lang="en">
<head>
    <title>Clash for Android 使用教程 &mdash; {$config["appName"]}</title>
    <link href="{$metron['assets_url']}/css/client/metron-icon.css" rel="stylesheet" type="text/css" />
    <link href="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.css" rel="stylesheet">
    {include file='include/global/head.tpl'}

    <style>
        /* 页面整体字体与行距优化 */
        .card-body {
            font-family: "Microsoft YaHei", sans-serif;
            font-size: 16px;
            line-height: 1.8;
            color: #333;
        }

        /* 教程段落标题 */
        .tutorial-section-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #2f80ed;
            border-left: 6px solid #2f80ed;
            padding-left: 12px;
            margin-bottom: 25px;
        }

        /* 图片美化 */
        img.rounded-lg {
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            transition: all 0.3s ease;
        }
        img.rounded-lg:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 18px rgba(0,0,0,0.25);
        }

        /* 提示块优化 */
        .alert-custom {
            border-radius: 10px;
            border: 1px solid rgba(47,128,237,0.2);
            background: rgba(47,128,237,0.05);
        }
        .alert-custom .alert-icon {
            color: #2f80ed;
        }

        /* code 样式优化 */
        code {
            background: rgba(47,128,237,0.1);
            color: #2f80ed;
            padding: 2px 6px;
            border-radius: 4px;
        }

        /* “返回顶部”按钮 */
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
            z-index: 99;
        }
        #backToTop:hover {
            background: #1c5dd6;
            transform: scale(1.1);
        }

        /* 下载按钮动画 */
        .btn-clash::after {
            content: "⟳";
            display: inline-block;
            margin-left: 8px;
            font-weight: bold;
            transition: transform 0.3s ease;
        }
        .btn-clash:active::after {
            transform: rotate(360deg);
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
                                <h2 class="text-white font-weight-bold my-2 mr-5">Clash for Android 使用教程</h2>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-flex flex-column-fluid">
                    <div class="container">

                        <!-- 教程主体 -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                    <div class="card-body">

                                        <!-- 简介 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">0. 简介</p>
                                                <p><code>Clash</code> 是一款支持多平台的代理工具，支持 <code>ss/v2ray/ssr</code>，并可进行规则分流。</p>
                                                <p><code>ClashR</code> 是基于 Clash 的扩展版本，增加了对 <code>SSR</code> 的支持。</p>
                                                <p>本教程仅供参考，因客户端更新可能与界面略有差异。</p>
                                            </div>
                                            <div class="col-lg-5">
                                                <a href="{$metron['assets_url']}/media/tutorial/android/clashr/clashr.png" data-lightbox="images">
                                                    <img class="rounded-lg" src="{$metron['assets_url']}/media/tutorial/android/clashr/clashr.png" style="width:100%">
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 下载客户端 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">1. 下载客户端</p>
                                                <a href="https://45.62.102.54:12598/jitu/cmfa.apk" class="btn btn-pill btn-clash mb-4">&nbsp;&nbsp;<i class="metron-clash text-white"></i>下载 Clash 客户端</a>
                                                <p>下载安装后打开客户端，并继续下一步。</p>
                                            </div>
                                            <div class="col-lg-5">
                                                <a href="{$metron['assets_url']}/media/tutorial/android/clashr/clashr.png" data-lightbox="images">
                                                    <img class="rounded-lg" src="{$metron['assets_url']}/media/tutorial/android/clashr/clashr.png" style="width:100%">
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 设置订阅 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">2. 设置订阅地址</p>
                                                {if in_array('clash',$metron['index_sub'])}
                                                <div class="btn-group mb-3 mr-3">
                                                    <button type="button" class="btn btn-pill btn-clash dropdown-toggle" data-toggle="dropdown">
                                                        &nbsp;&nbsp;<i class="metron-clash text-white"></i>Clash 订阅配置&nbsp;&nbsp;
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <button class="dropdown-item copy-text" data-clipboard-text="{$subInfo["clash"]}">复制 Clash 订阅</button>
                                                        <div class="dropdown-divider"></div>
                                                        <button class="dropdown-item" onclick="importSublink('clash')">一键导入 Clash</button>
                                                    </div>
                                                </div>
                                                {/if}

                                                <p>点击上方按钮导入节点配置，名称可填写 <code>{$config["appName"]}</code>。</p>

                                                <div class="alert alert-custom alert-outline-primary fade show mb-5">
                                                    <div class="alert-icon"><i class="flaticon-warning"></i></div>
                                                    <div class="alert-text">
                                                        <p>如无法一键导入，请手动设置：</p>
                                                        <p>复制订阅地址 → 打开 <code>配置</code> → 选择 <code>新配置</code> → 粘贴订阅 → 保存。</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <a href="/theme/metron/images/an_01.jpg" data-lightbox="images">
                                                    <img class="rounded-lg" src="/theme/metron/images/an_01.jpg" style="width:100%">
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 开启代理 -->
                                        <div class="row p-5">
                                            <div class="col-lg-7 pb-5">
                                                <p class="tutorial-section-title">3. 开启代理并选择节点</p>
                                                <p>点击 <code>已停止</code> 切换为 <code>运行中</code>。</p>
                                                <p>进入 <code>控制面板</code> 选择节点，规则设置完成即可使用。</p>
                                            </div>
                                            <div class="col-lg-5">
                                                <a href="{$metron['assets_url']}/media/tutorial/android/clashr/clashr.png" data-lightbox="images">
                                                    <img class="rounded-lg" src="{$metron['assets_url']}/media/tutorial/android/clashr/clashr.png" style="width:100%">
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 教程结束 -->

                    </div>
                </div>
            </div>
            {include file='include/global/footer.tpl'}
        </div>
    </div>
</div>

{include file='include/global/scripts.tpl'}
{include file='include/global/import_sublink.tpl'}
<script src="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.js"></script>

<!-- 返回顶部按钮 -->
<button id="backToTop" title="返回顶部">↑</button>
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
