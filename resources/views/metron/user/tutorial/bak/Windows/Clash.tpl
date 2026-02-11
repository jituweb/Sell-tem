<!DOCTYPE html>
<html lang="en">
<head>
    <title>Clash 使用教程 &mdash; {$config["appName"]}</title>
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
                                <h2 class="text-white font-weight-bold my-2 mr-5">Clash for Windows 使用教程</h2>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-flex flex-column-fluid">
                    <div class="container">

                        <!-- 教程内容开始 -->
                        <div class="row" data-sticky-container>
                            <div class="col-12">
                                <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                    <div class="card-body">

                                        <!-- 段落 0 -->
                                        <div class="row p-5 align-items-center">
                                            <div class="col-lg-7 pb-5">
                                                <p class="font-size-h1 pb-5"><strong>0. 简介</strong></p>
                                                <div class="example-preview">
                                                    <p><code>Clash</code> 是一款用 Go 语言开发的跨平台代理工具，支持 Linux/MacOS/Windows/Android 等系统，支持 ss/v2ray（不支持 ssr），具备规则分流功能。</p>
                                                    <p>由于客户端持续更新，界面或功能可能与教程略有不同，请以实际使用为准。</p>
                                                    <p><code>ClashR</code> 则在 Clash 基础上增加 SSR 支持。</p>
                                                    <code>Clash for Windows 仅支持 Windows 64 位系统。</code>
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 段落 1 -->
                                        <div class="row p-5 align-items-center">
                                            <div class="col-lg-7 pb-5">
                                                <p class="font-size-h1 pb-5"><strong>1. 下载客户端</strong></p>
                                                <a href="https://45.62.102.54:12598/jitu/Clash244.exe" class="btn btn-pill btn-clash mb-4" target="_blank">
                                                    <i class="metron-clash text-white"></i>&nbsp;下载 Clash 客户端
                                                </a>
                                                <div class="h6 pt-2">下载安装后从桌面或目录打开 <code>Clash for Windows.exe</code></div>
                                            </div>
                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="/theme/metron/images/window_7.jpg" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="/theme/metron/images/window_7.jpg"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 段落 2 -->
                                        <div class="row p-5 align-items-center">
                                            <div class="col-lg-7 pb-5">
                                                <p class="font-size-h1 pb-5"><strong>2. 设置订阅地址</strong></p>
                                                {if in_array('clash',$metron['index_sub'])}
                                                <div class="btn-group mb-3 mr-3">
                                                    <button type="button" class="btn btn-pill btn-clash dropdown-toggle" data-toggle="dropdown">
                                                        <i class="metron-clash text-white"></i>&nbsp;Clash 订阅配置
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <button type="button" class="dropdown-item copy-text" data-clipboard-text="{$subInfo["clash"]}">复制 Clash 订阅</button>
                                                        <div class="dropdown-divider"></div>
                                                        <button type="button" class="dropdown-item" onclick="importSublink('clash')">一键导入 Clash</button>
                                                    </div>
                                                </div>
                                                {/if}
                                                <div class="h6 pt-2">点击上方按钮导入节点配置后，<code>订阅</code> 页面会新增配置选项卡。</div>
                                            </div>
                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="/theme/metron/images/window_1.jpg" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="/theme/metron/images/window_1.jpg"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 段落 3 -->
                                        <div class="row p-5 align-items-center">
                                            <div class="col-lg-7 pb-5">
                                                <p class="font-size-h1 pb-5"><strong>3. 选择节点</strong></p>
                                                <div class="h6 pt-2">进入 <code>订阅</code> 页面，切换至代理节点界面。</div>
                                                <div class="h6 pt-2">选择合适的规则链路与节点。</div>
                                            </div>
                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="/theme/metron/images/window_2.jpg" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="/theme/metron/images/window_2.jpg"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 段落 4 -->
                                        <div class="row p-5 align-items-center">
                                            <div class="col-lg-7 pb-5">
                                                <p class="font-size-h1 pb-5"><strong>4. 选择节点</strong></p>
                                                <div class="h6 pt-2">点击 <code>代理</code> 页面，在节点列表中选择要使用的代理（默认是直连）。</div>
                                            </div>
                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="/theme/metron/images/window_3.jpg" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="/theme/metron/images/window_3.jpg"/>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="separator separator-dashed separator-border-4"></div>

                                        <!-- 段落 5 -->
                                        <div class="row p-5 align-items-center">
                                            <div class="col-lg-7 pb-5">
                                                <p class="font-size-h1 pb-5"><strong>5. 开启代理</strong></p>
                                                <div class="h6 pt-2">点击 <code>设置</code> 页面，打开 <code>系统代理</code> 开关。</div>
                                                <div class="h6 pt-2">系统代理按钮变为蓝色即表示启用成功。</div>
                                            </div>
                                            <div class="col-lg-5">
                                                <a class="image-popup-no-margins" href="/theme/metron/images/window_5.jpg" data-lightbox="images">
                                                    <img class="rounded-lg" style="width:100%" src="/theme/metron/images/window_5.jpg"/>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 教程内容结束 -->

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

</body>
</html>
