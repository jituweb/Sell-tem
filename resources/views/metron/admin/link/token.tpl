{include file='admin/main.tpl'}
<div class="page-wrapper" style="background: #f4f7fa; min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">
    <div style="width: 100%; max-width: 440px; padding: 20px;">
        
        <div class="text-center mb-4">
            <h2 style="color: #1e293b; font-weight: 700; letter-spacing: -0.5px;">信息检索</h2>
            <p style="color: #64748b; font-size: 14px;">支持通过 User ID 或 Token 相互查询</p>
        </div>

        <div style="background: white; border-radius: 24px; padding: 32px; box-shadow: 0 10px 25px -5px rgba(0,0,0,0.05);">
            
            <div id="search-section">
                <div class="mb-4">
                    <label style="display: block; font-size: 13px; font-weight: 600; color: #475569; margin-bottom: 8px; margin-left: 4px;">搜索内容</label>
                    <div style="position: relative;">
                        <i class="fas fa-search" style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #94a3b8;"></i>
                        <input type="text" id="token" placeholder="输入 ID 或 Token..." 
                            style="width: 100%; height: 52px; padding: 0 16px 0 45px; border: 2px solid #f1f5f9; border-radius: 14px; font-size: 15px; transition: all 0.3s; outline: none; background: #f8fafc;"
                            onfocus="this.style.borderColor='#3b82f6'; this.style.background='white'; this.style.boxShadow='0 0 0 4px rgba(59, 130, 246, 0.1)';"
                            onblur="this.style.borderColor='#f1f5f9'; this.style.background='#f8fafc';"
                            onkeypress="if(event.key==='Enter') queryToken()">
                    </div>
                </div>

                <button class="btn w-100" onclick="queryToken()" style="height: 52px; background: #3b82f6; color: white; border: none; border-radius: 14px; font-weight: 600; font-size: 16px; cursor: pointer; transition: all 0.2s; display: flex; align-items: center; justify-content: center; gap: 8px;">
                    <span>执行查询</span>
                </button>
            </div>

            <div id="result" style="display:none; margin-top: 24px; border-top: 1px solid #f1f5f9; padding-top: 24px;">
                <div id="loading" style="display:none; text-align: center; padding: 20px 0;">
                    <div class="spinner-border text-primary" style="width: 2rem; height: 2rem;"></div>
                </div>
                
                <div id="successResult" style="display:none;">
                    <div class="info-group" style="margin-bottom: 16px;">
                        <p style="font-size: 11px; color: #94a3b8; margin: 0 0 6px 4px; font-weight: 700; letter-spacing: 0.5px;">USER ID (点击复制)</p>
                        <div onclick="copyText('userIdDisplay', this)" style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 12px; padding: 16px; cursor: pointer; transition: all 0.2s; position: relative; overflow: hidden;" onmouseover="this.style.background='#f1f5f9'" onmouseout="this.style.background='#f8fafc'">
                            <span id="userIdDisplay" style="font-family: 'SFMono-Regular', Consolas, monospace; font-size: 16px; color: #1e293b; font-weight: 700;"></span>
                            <div class="copy-hint" style="position: absolute; right: 12px; top: 50%; transform: translateY(-50%); font-size: 10px; color: #3b82f6; font-weight: 700; opacity: 0; transition: 0.2s;">DONE!</div>
                        </div>
                    </div>

                    <div class="info-group" style="margin-bottom: 24px;">
                        <p style="font-size: 11px; color: #94a3b8; margin: 0 0 6px 4px; font-weight: 700; letter-spacing: 0.5px;">TOKEN (点击复制)</p>
                        <div onclick="copyText('tokenDisplay', this)" style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 12px; padding: 16px; cursor: pointer; transition: all 0.2s; position: relative; overflow: hidden;" onmouseover="this.style.background='#f1f5f9'" onmouseout="this.style.background='#f8fafc'">
                            <div id="tokenDisplay" style="font-family: 'SFMono-Regular', Consolas, monospace; font-size: 13px; color: #334155; word-break: break-all; line-height: 1.5; min-height: 20px;"></div>
                            <div class="copy-hint" style="position: absolute; right: 12px; top: 50%; transform: translateY(-50%); font-size: 10px; color: #3b82f6; font-weight: 700; opacity: 0; transition: 0.2s;">DONE!</div>
                        </div>
                    </div>

                    <div class="text-center">
                        <button onclick="queryAgain()" style="background: none; border: none; color: #94a3b8; font-size: 13px; font-weight: 600; cursor: pointer; transition: 0.2s;" onmouseover="this.style.color='#3b82f6'" onmouseout="this.style.color='#94a3b8'">
                            <i class="fas fa-undo mr-1"></i> 返回重新输入
                        </button>
                    </div>
                </div>
                
                <div id="errorResult" style="display:none; text-align: center;">
                    <div style="color: #ef4444; background: #fef2f2; padding: 16px; border-radius: 12px; margin-bottom: 16px;">
                        <p id="errorMsg" style="font-size: 14px; font-weight: 600; margin: 0;"></p>
                    </div>
                    <button onclick="queryAgain()" style="color: #64748b; background: none; border: none; font-size: 13px; font-weight: 600; cursor: pointer; text-decoration: underline;">重试</button>
                </div>
            </div>
        </div>
    </div>
</div>

{literal}
<script>
function queryToken() {
    const inputVal = $('#token').val().trim();
    if (!inputVal) {
        showError('请输入查询内容');
        return;
    }
    
    $('#search-section').css('opacity', '0.5');
    $('#result').slideDown(300);
    $('#loading').show();
    $('#successResult, #errorResult').hide();

    // 构造请求参数：如果输入全是数字，则认为是 userid，否则是 token
    let params = {};
    if (/^\d+$/.test(inputVal)) {
        params = { userid: inputVal };
    } else {
        params = { token: inputVal };
    }
    
    $.post('/admin/link/token', params, function (res) {
        $('#loading').hide();
        $('#search-section').css('opacity', '1');
        if (res.ret === 1) {
            $('#successResult').fadeIn();
            $('#userIdDisplay').text(res.data.userid || res.data.user_id || '-');
            $('#tokenDisplay').text(res.data.token || '-');
        } else {
            renderError(res.msg || '未找到匹配结果');
        }
    }).fail(function() {
        $('#loading').hide();
        $('#search-section').css('opacity', '1');
        renderError('服务器通信异常');
    });
}

function copyText(elementId, container) {
    const text = $('#' + elementId).text();
    if (text && text !== '-') {
        navigator.clipboard.writeText(text).then(() => {
            const hint = $(container).find('.copy-hint');
            const originalBg = container.style.background;
            
            // 触觉反馈视觉效果
            container.style.background = '#eff6ff';
            container.style.borderColor = '#3b82f6';
            hint.css('opacity', '1');
            
            setTimeout(() => {
                container.style.background = originalBg;
                container.style.borderColor = '#e2e8f0';
                hint.css('opacity', '0');
            }, 1000);
        });
    }
}

function renderError(msg) {
    $('#errorResult').fadeIn();
    $('#errorMsg').text(msg);
}

function queryAgain() {
    $('#result').slideUp(200, function() {
        $('#token').val('').focus();
    });
}

function showError(msg) {
    $('#result').show();
    $('#loading').hide();
    renderError(msg);
}

$(document).ready(function() {
    $('#token').focus();
});
</script>
{/literal}