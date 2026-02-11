<!DOCTYPE html>
<html lang="en">
    <head>
        <title>极兔 使用教程 &mdash; {$config["appName"]}</title>
        <link href="{$metron['assets_url']}/css/client/metron-icon.css" rel="stylesheet" type="text/css" />
        <link href="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.css" rel="stylesheet" >
        {include file='include/global/head.tpl'}
        <div class="d-flex flex-column flex-root">
            <div class="d-flex flex-row flex-column-fluid page">
                <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
                    {include file='include/global/menu.tpl'}
                    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                        <div class="subheader min-h-lg-175px pt-5 pb-7 subheader-transparent" id="kt_subheader">
                            <div class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                                <div class="d-flex align-items-center flex-wrap mr-2">
                                    <div class="d-flex flex-column">
                                        <h2 class="text-white font-weight-bold my-2 mr-5">极兔客户端使用教程</h2>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">

                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-column-fluid">
                            <div class="container">

                                <!-- 开始 :: 教程内容 -->
                                <div class="row" data-sticky-container>
                                    <div class="col-12">
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header">
                                                <div class="card-title">
                                                </div>
                                            </div>
                                            <div class="card-body">

<!-- 开始 :: 内容段落 1 -->
                                                <div class="row p-5">

                                                    <!-- 开始 :: 段落文本区 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <!-- 开始 :: 段落标题 -->
                                                        <p class="font-size-h1 pb-5"><strong>0. 简介</strong></p>
                                                        <!-- 结束 :: 段落标题 -->
                                                        <div class="example-preview">
                                                            <p><code>极兔客户端</code>基于 Clash内核制作，代理规则由极兔团队维护，性能优异并且持续迭代版本，推送升级。无需繁琐的配置操作，登录极兔账号密码即可使用。</p>
                                                            <code>极兔客户端仅支持Windows 64位系统，32位系统请选用其他客户端</code>
                                                        </div>
                                                    </div>
                                                    <!-- 结束 :: 段落文本区 -->

                                                    <!-- 开始 :: 图片 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <!-- 图片点击打开的灯箱高清图 -->
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png" data-lightbox="images">
                                                        <!-- 页面显示的图片缩略图 -->
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png"/></a>
                                                    </div>
                                                    <!-- 结束 :: 图片 -->

                                                </div>
<!-- 结束 :: 内容段落 1 -->

                                                <!-- 开始 :: 分割线 -->
                                                <div class="separator separator-dashed separator-border-4"></div>
                                                <!-- 结束 :: 分割线 -->
<!-- 开始 :: 内容段落 0 -->
                                                <div class="row p-5">
                                                    <!-- 段落内容 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <!-- 开始 :: 段落标题 -->
                                                        <p class="font-size-h1 pb-5"><strong> 客户端下载注意事项</strong></p>
                                                        <!-- 结束 :: 段落标题 -->
  
                                                        <div class="h6 pt-2">
                                                        常见问题：<br>
                                                        <p>01：使用edge浏览下载提示不安全无法安装？<br>
                                                        <br><code>这是因为我们未在微软申请数字签名，点最右边的三个点，点保留----点显示详细信息----点仍要保留，即可完成下载,请放心文件安全无毒!</code></p>
                                                        02：Windows 提示“未知发布者”或“已阻止运行”？<br><br>
         <code>这是因为我们未在微软申请数字签名，可点击“更多信息”→“仍要运行”继续安装。请放心，文件安全无毒。</code></div>
                                                    </div>
                                                    <!-- 开始 :: 图片 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png"/></a>
                                                    </div>
                                                    <!-- 结束 :: 图片 -->
                                                </div>
<!-- 结束 :: 内容段落 0 -->

                                                <!-- 开始 :: 分割线 -->
                                                <div class="separator separator-dashed separator-border-4"></div>
                                                <!-- 结束 :: 分割线 -->


<!-- 开始 :: 内容段落 2 -->
                                                <div class="row p-5">
                                                    <!-- 段落内容 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <!-- 开始 :: 段落标题 -->
                                                        <p class="font-size-h1 pb-5"><strong>1. 下载客户端</strong></p>
                                                        <!-- 结束 :: 段落标题 -->
                                                        <!-- 开始 :: 客户端下载按钮 -->
                                                        <a href="https://45.62.102.54:12598/jitu/jitu_Windows.exe" class="btn btn-pill btn-clash mb-4" target="_blank">&nbsp;&nbsp;<i class="metron-clash text-white" ></i>下载极兔客户端</a>&nbsp;&nbsp;&nbsp;
                                                        <!-- 结束 :: 客户端下载按钮 -->
                                                        <div class="h6 pt-2">下载安装后从桌面打开<br />或在目录中打开 <code>jitu_Windows</code></div>
                                                    </div>
                                                    <!-- 开始 :: 图片 -->
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png"/></a>
                                                    </div>
                                                    <!-- 结束 :: 图片 -->
                                                </div>
<!-- 结束 :: 内容段落 2 -->

                                                <!-- 开始 :: 分割线 -->
                                                <div class="separator separator-dashed separator-border-4"></div>
                                                <!-- 结束 :: 分割线 -->

<!-- 开始 :: 内容段落 3 -->
                                                <div class="row p-5">
                                                    <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                        <!-- 开始 :: 段落标题 -->
                                                        <p class="font-size-h1 pb-5"><strong>2. 登录极兔账号登录后，选择节点就能使用</strong></p>
                                                        <!-- 结束 :: 段落标题 -->
                                                        <!-- 开始 :: 订阅按钮 -->
                                                        <!-- 结束 :: 订阅按钮 -->
                                                    </div>
                                                    <div class="col-sm-12 col-md-12 col-lg-5">
                                                        <a class="image-popup-no-margins" href="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="{$metron['assets_url']}/media/tutorial/windows/clashr/clashr.png"/></a>
                                                    </div>
                                                </div>
<!-- 结束 :: 内容段落 3 -->

                                                <!-- 开始 :: 分割线 -->
                                                <div class="separator separator-dashed separator-border-4"></div>
                                                <!-- 结束 :: 分割线 -->


                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 结束 :: 教程内容 -->

							</div>
						</div>
					</div>
                    {include file='include/global/footer.tpl'}
				</div>
			</div>
		</div>

        {include file='include/global/scripts.tpl'}
        {include file='include/global/import_sublink.tpl'}
        <script src="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.js" type="text/javascript"></script>

    </body>
</html>
