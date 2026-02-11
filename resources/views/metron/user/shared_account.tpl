<!DOCTYPE html>
<html lang="en">
<head>
    <title>共享账号 &mdash; {$config["appName"]}</title>
    <link href="{$metron['assets_url']}/css/pages/users/shared_account.css" rel="stylesheet" type="text/css" />
    {include file='include/global/head.tpl'}
    <style>
    /* ✅ 使用须知弹窗字体增强 */
    #noticeModal .modal-body {
        font-size: 16px;
        line-height: 1.8;
    }
    #noticeModal li {
        margin-bottom: 10px;
    }
    #noticeModal .modal-title {
        font-size: 20px;
        font-weight: 600;
    }

    /* ✅ FAQ 模块字体增强 */
    #faqAccordion h5.mb-0 {
        font-size: 18px;
        font-weight: 600;
        color: #333;
    }
    #faqAccordion .card-body {
        font-size: 15px;
        color: #555;
        line-height: 1.7;
    }
    #faqAccordion .card-header {
        background-color: #f9f9f9;
        transition: background-color 0.2s ease;
    }
    #faqAccordion .card-header:hover {
        background-color: #eef7ff;
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
                                <h2 class="text-white font-weight-bold my-2 mr-5">共享账号</h2>
                            </div>
                        </div>
                        <div class="d-flex align-items-center" style="gap:10px;">
    <!-- 使用须知弹窗按钮 -->
    <button class="btn btn-light-info font-weight-bold" data-toggle="modal" data-target="#noticeModal">
        查看使用须知
    </button>

    <!-- Shadowrocket 教程跳转按钮 -->
   <a href="/user/tutorial?os=iOS&client=Shadowrocket" class="btn btn-light-success font-weight-bold" target="_blank">
    Shadowrocket 使用教程
</a>

</div>

                    </div>
                </div>

                <div class="d-flex flex-column-fluid">
                    <div class="container">
                        {$css = [1 => 'primary', 2 => 'success', 3 => 'warning', 4 => 'danger', 5 => 'info']}
                        {$fornum = 0}
                        <div class="row">
                            {foreach $metron['shared_account'] as $type}
                            {if $type['show'] === false}
                            {continue}
                            {/if}
                            {$fornum=$fornum+1}
                            {$typeNum = count($type) - 1 }
                            <div class="col-lg-12">
                                <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                    <div class="card-header">
                                        <div class="card-title">
                                            <h3 class="card-label text-{$css[$fornum]}"><strong>{$type@key}</strong></h3>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div>
                                            <div class="kanban-container" style="max-width:100%; display:flex; flex-wrap:wrap; gap:15px;">
                                                {foreach $type as $acc}
                                                {if is_bool($acc)}
                                                {continue}
                                                {/if}
                                                <div class="kanban-board {if $typeNum===1}kanban-1{elseif $typeNum===2}kanban-2{elseif $typeNum===3}kanban-3{elseif $typeNum===4}kanban-4{elseif $typeNum >= 5}kanban-5{/if}"
                                                     style="width:250px;">
                                                    <header class="kanban-board-header light-{$css[$fornum]}">
                                                        <div class="kanban-title-board">
                                                            {$acc['name']}&nbsp;&nbsp;&nbsp;
                                                            {if $acc['class'] > 0}{$metron['user_level'][$acc['class']]}专享{/if}
                                                            {if $user->class >= $acc['class'] && $acc['check'] === true}
                                                            <span class="btn btn-primary font-weight-bold btn-sm pull-r cursor_onclick"
                                                                  onclick="shared_account.check('{$type@key}', '{$acc@key}');">检测账号</span>
                                                            {/if}
                                                        </div>
                                                    </header>
                                                    <main class="kanban-drag">
                                                        {if $user->class >= $acc['class']}
                                                        <label>账号：</label>
                                                        <div class="{$style[$theme_style]['shared']['item']} kanban-item copy-text cursor_onclick"
                                                             data-clipboard-text="{$acc['account']}">{$acc['account']}</div>
                                                        <label>密码：</label>
                                                        <div class="{$style[$theme_style]['shared']['item']} kanban-item copy-text cursor_onclick"
                                                             data-clipboard-text="{$acc['passwd']}">
                                                             {if $acc['hidepawd'] === true}点击复制后在密码框粘贴{else}{$acc['passwd']}{/if}
                                                        </div>
                                                        {else}
                                                        <label>账号：</label>
                                                        <div class="{$style[$theme_style]['shared']['item']} kanban-item">
                                                            该账号仅 <span class="text-{$css[$fornum]}">{$metron['user_level'][$acc['class']]}[LV.{$acc['class']}]</span> 及以上会员可用
                                                        </div>
                                                        <label>密码：</label>
                                                        <div class="{$style[$theme_style]['shared']['item']} kanban-item">
                                                            该账号仅 <span class="text-{$css[$fornum]}">{$metron['user_level'][$acc['class']]}[LV.{$acc['class']}]</span> 及以上会员可用
                                                        </div>
                                                        {/if}
                                                        
                                                         <footer class="p-2 text-center text-dark small">
                                                         {if isset($acc['time']) && $acc['time'] neq ''}
                                                          更新时间：{$acc['time']}
                                                         {else}
                                                         更新时间：暂无数据
                                                         {/if}
                                                         </footer>

                                                    </main>
                                                    
                                                    
                                                </div>
                                                {/foreach}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/foreach}
                        </div>

                        <!-- ✅ FAQ 模块 -->
                        <div class="card card-custom gutter-b mt-10 {$metron['style_shadow']}">
                            <div class="card-header">
                                <div class="card-title">
                                    <h3 class="card-label text-primary"><i class="fas fa-question-circle mr-2"></i>常见问题 FAQ</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="accordion" id="faqAccordion">
                                    <div class="card">
                                        <div class="card-header cursor-pointer" data-toggle="collapse" data-target="#faq1">
                                            <h5 class="mb-0">问题1：为什么提示“账号仅限会员使用”？</h5>
                                        </div>
                                        <div id="faq1" class="collapse show" data-parent="#faqAccordion">
                                            <div class="card-body">该账号为特定等级会员专享，请购买套餐后即可使用。</div>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="card-header cursor-pointer" data-toggle="collapse" data-target="#faq2">
                                            <h5 class="mb-0">问题2：更新软件时提示账号封禁怎么办？</h5>
                                        </div>
                                        <div id="faq2" class="collapse" data-parent="#faqAccordion">
                                            <div class="card-body">iOS App Store 有下载机制限制，软件必须使用 下载该软件的 Apple ID 账号才能更新。<br>
                                     如需使用其他账号更新，请先卸载原软件，再使用新账号重新下载安装。<br>
                                      建议保持使用同一账号更新，以避免账号被封或无法打开软件。</div>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="card-header cursor-pointer" data-toggle="collapse" data-target="#faq3">
                                            <h5 class="mb-0">问题3：如果登陆提示ID密码不对怎么办？</h5>
                                        </div>
                                        <div id="faq3" class="collapse" data-parent="#faqAccordion">
                                            <div class="card-body">本站系统默认10分钟会检测一次账号状态，并修改密码，请刷新网页获取最新密码。</div>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="card-header cursor-pointer" data-toggle="collapse" data-target="#faq4">
                                            <h5 class="mb-0">问题4：提示双重认证怎么办？</h5>
                                        </div>
                                        <div id="faq4" class="collapse" data-parent="#faqAccordion">
                                            <div class="card-body">登陆共享ID如果提示AppleＩＤ安全，请点最下面的其他选择---然后点不升级及可跳过验证。</div>
                                        </div>
                                    </div>
                                    
                                    <div class="card">
                                        <div class="card-header cursor-pointer" data-toggle="collapse" data-target="#faq5">
                                            <h5 class="mb-0">问题5：如果提示需要回答安全问题怎么办？</h5>
                                        </div>
                                        <div id="faq5" class="collapse" data-parent="#faqAccordion">
                                            <div class="card-body">那说明你登陆的位置不对，在appstore登陆不会跳转到网页，不需要回答安全问题，请看清楚shadowrocket教程第一张图片在操作。</div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                    </div><!-- end container -->
                </div><!-- end flex -->
            </div>
            {include file='include/global/footer.tpl'}
        </div>
    </div>
</div>

<!-- ✅ 使用须知弹窗 Modal -->
<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="noticeModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h5 class="modal-title" id="noticeModalLabel"><i class="fas fa-info-circle mr-2"></i>共享账号使用须知</h5>
      </div>
      <div class="modal-body">
        <ul class="pl-4">
          <li>共享账号仅限本站会员内部使用，请勿外泄或分享至其他平台。</li>
          <li>请勿更改共享账号的密码、语言、地区或绑定邮箱等设置。</li>
          <li>本站系统默认10分钟会检测一次账号状态，会自动修复账号状态。</li>
          <li>请勿在手机设置里面登陆共享账号，shadowrocket下载完请立刻退出ID。</li>
          <li>本站有权根据滥用情况暂停或更换共享账号。</li>
        </ul>
      </div>
      <div class="modal-footer">
        <button id="agreeBtn" type="button" class="btn btn-primary">我已阅读并同意</button>
      </div>
    </div>
  </div>
</div>

{include file='include/global/scripts.tpl'}

<!-- ✅ 首次进入弹窗逻辑 -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const agreeBtn = document.getElementById('agreeBtn');

    // 首次进入显示弹窗（本地未记录已读状态）
    if (!localStorage.getItem('shared_notice_read')) {
        $('#noticeModal').modal('show');
    }

    // 点击“我已阅读并同意”后关闭并记录状态
    agreeBtn.addEventListener('click', function() {
        localStorage.setItem('shared_notice_read', 'true');
        $('#noticeModal').modal('hide');
    });

    // 禁止通过 ESC 或点击遮罩关闭
    $('#noticeModal').modal({ backdrop: 'static', keyboard: false });
});
</script>
</body>
</html>
