{include file='admin/main.tpl'}
<div class="page-wrapper" style="background: #f4f7fa; min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">
    <div style="width: 100%; max-width: 1000px; padding: 20px;">
        
        <div class="text-center mb-6">
            <h2 style="color: #1e293b; font-weight: 700; letter-spacing: -0.5px;">用户流量查询</h2>
            <p style="color: #64748b; font-size: 14px;">查询用户最近 30 天每日流量使用情况</p>
        </div>

        <div style="background: white; border-radius: 24px; padding: 32px; box-shadow: 0 10px 25px -5px rgba(0,0,0,0.05);">
            
            <!-- 查询区域 -->
            <div id="search-section">
                <div class="mb-6">
                    <label style="display: block; font-size: 13px; font-weight: 600; color: #475569; margin-bottom: 8px; margin-left: 4px;">用户 ID</label>
                    <div style="position: relative;">
                        <i class="fas fa-user" style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: #94a3b8;"></i>
                        <input type="number" id="user_id" placeholder="请输入用户 ID..." value="{$user_id|escape}"
                            style="width: 100%; height: 52px; padding: 0 16px 0 45px; border: 2px solid #f1f5f9; border-radius: 14px; font-size: 15px; transition: all 0.3s; outline: none; background: #f8fafc;"
                            onfocus="this.style.borderColor='#3b82f6'; this.style.background='white'; this.style.boxShadow='0 0 0 4px rgba(59, 130, 246, 0.1)';"
                            onblur="this.style.borderColor='#f1f5f9'; this.style.background='#f8fafc';"
                            onkeypress="if(event.key==='Enter') searchUserTraffic()">
                    </div>
                </div>

                <div class="flex gap-3">
                    <button class="btn flex-1" onclick="searchUserTraffic()" id="searchBtn" style="height: 52px; background: #3b82f6; color: white; border: none; border-radius: 14px; font-weight: 600; font-size: 16px; cursor: pointer; transition: all 0.2s; display: flex; align-items: center; justify-content: center; gap: 8px;">
                        <i class="fas fa-search"></i>
                        <span id="btnText">查询流量</span>
                    </button>
                    
                    {if $user_id}
                    <button class="btn" onclick="clearSearch()" style="width: 52px; height: 52px; background: #f1f5f9; color: #64748b; border: none; border-radius: 14px; font-weight: 600; cursor: pointer; transition: all 0.2s; display: flex; align-items: center; justify-content: center;"
                            onmouseover="this.style.background='#e2e8f0'" onmouseout="this.style.background='#f1f5f9'">
                        <i class="fas fa-times"></i>
                    </button>
                    {/if}
                </div>
            </div>

            <!-- 错误提示 -->
            {if $error}
            <div style="margin-top: 20px; padding: 16px; background: #fef2f2; border: 1px solid #fecaca; border-radius: 12px; color: #991b1b; font-size: 14px;">
                <i class="fas fa-exclamation-circle" style="margin-right: 8px;"></i>
                {$error|escape}
            </div>
            {/if}

            <!-- 加载状态 -->
            <div id="loading" style="display:none; text-align: center; padding: 40px 0;">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;"></div>
                <p style="color: #64748b; margin-top: 16px; font-size: 14px;">正在查询数据...</p>
            </div>

            <!-- 结果区域 -->
            {if $traffic}
            <div id="result-section" class="mt-8">
                <!-- 统计摘要 -->
                {assign var="total_used" value=0}
                {assign var="max_cumulative" value=0}
                {assign var="reset_count" value=0}
                {assign var="days" value=count($traffic)}
                {foreach $traffic as $row}
                    {assign var="total_used" value=$total_used+$row['used_gb']}
                    {if $row['cumulative_gb'] > $max_cumulative}
                        {assign var="max_cumulative" value=$row['cumulative_gb']}
                    {/if}
                    {if $row['reset_flag'] == 1}
                        {assign var="reset_count" value=$reset_count+1}
                    {/if}
                {/foreach}
                
                <div class="flex gap-4 mb-8" style="display: flex; gap: 16px; margin-bottom: 32px; flex-wrap: wrap;">
                    <div style="flex: 1; min-width: 200px; background: linear-gradient(135deg, #3b82f6, #1d4ed8); border-radius: 16px; padding: 20px; color: white;">
                        <div style="font-size: 13px; opacity: 0.9; margin-bottom: 8px;">30天总使用</div>
                        <div style="font-size: 28px; font-weight: 700;">{$total_used|number_format:2}</div>
                        <div style="font-size: 12px; opacity: 0.8; margin-top: 4px;">GB</div>
                    </div>
                    
                    <div style="flex: 1; min-width: 200px; background: linear-gradient(135deg, #10b981, #059669); border-radius: 16px; padding: 20px; color: white;">
                        <div style="font-size: 13px; opacity: 0.9; margin-bottom: 8px;">当前累计值</div>
                        <div style="font-size: 28px; font-weight: 700;">{$max_cumulative|number_format:2}</div>
                        <div style="font-size: 12px; opacity: 0.8; margin-top: 4px;">GB</div>
                    </div>
                    
                    <div style="flex: 1; min-width: 200px; background: linear-gradient(135deg, #8b5cf6, #7c3aed); border-radius: 16px; padding: 20px; color: white;">
                        <div style="font-size: 13px; opacity: 0.9; margin-bottom: 8px;">日均使用</div>
                        <div style="font-size: 28px; font-weight: 700;">
                            {if $days > 0}
                                {$total_used/$days|number_format:2}
                            {else}
                                0.00
                            {/if}
                        </div>
                        <div style="font-size: 12px; opacity: 0.8; margin-top: 4px;">GB</div>
                    </div>
                    
                    {if $reset_count > 0}
                    <div style="flex: 1; min-width: 200px; background: linear-gradient(135deg, #ef4444, #dc2626); border-radius: 16px; padding: 20px; color: white;">
                        <div style="font-size: 13px; opacity: 0.9; margin-bottom: 8px;">重置次数</div>
                        <div style="font-size: 28px; font-weight: 700;">{$reset_count}</div>
                        <div style="font-size: 12px; opacity: 0.8; margin-top: 4px;">次</div>
                    </div>
                    {/if}
                </div>

                <!-- 流量表格 -->
                <div style="border-radius: 16px; overflow: hidden; border: 1px solid #f1f5f9;">
                    <table style="width: 100%; border-collapse: collapse; background: white;">
                        <thead>
                            <tr style="background: #f8fafc;">
                                <th style="padding: 16px; text-align: left; font-size: 12px; font-weight: 600; color: #64748b; border-bottom: 1px solid #f1f5f9;">
                                    <i class="far fa-calendar-alt mr-2"></i>日期
                                </th>
                                <th style="padding: 16px; text-align: left; font-size: 12px; font-weight: 600; color: #64748b; border-bottom: 1px solid #f1f5f9;">
                                    <i class="fas fa-download mr-2"></i>当日使用 (GB)
                                </th>
                                <th style="padding: 16px; text-align: left; font-size: 12px; font-weight: 600; color: #64748b; border-bottom: 1px solid #f1f5f9;">
                                    <i class="fas fa-chart-line mr-2"></i>累计总值 (GB)
                                </th>
                                <th style="padding: 16px; text-align: left; font-size: 12px; font-weight: 600; color: #64748b; border-bottom: 1px solid #f1f5f9;">
                                    <i class="fas fa-flag mr-2"></i>状态
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        {foreach $traffic as $row}
                            <tr style="border-bottom: 1px solid #f1f5f9; transition: background 0.2s;" 
                                onmouseover="this.style.background='#f8fafc'" 
                                onmouseout="this.style.background='white'">
                                <td style="padding: 16px; font-size: 14px; color: #1e293b; font-weight: 500;">
                                    <i class="far fa-calendar text-slate-400 mr-2"></i>
                                    {$row['date']}
                                </td>
                                <td style="padding: 16px;">
                                    <div style="display: flex; align-items: center; gap: 12px;">
                                        <div style="flex: 1; height: 6px; background: #f1f5f9; border-radius: 3px; overflow: hidden; max-width: 100px;">
                                            {assign var="percentage" value=min(100, ($row['used_gb']/10)*100)}
                                            <div style="width: {$percentage}%; height: 100%; background: linear-gradient(90deg, #3b82f6, #60a5fa); border-radius: 3px;"></div>
                                        </div>
                                        <span style="font-family: 'SFMono-Regular', Consolas, monospace; font-size: 14px; font-weight: 600; color: #1e293b; min-width: 70px;">
                                            {$row['used_gb']} GB
                                        </span>
                                    </div>
                                </td>
                                <td style="padding: 16px; font-size: 14px; color: #1e293b; font-weight: 500;">
                                    {$row['cumulative_gb']} GB
                                </td>
                                <td style="padding: 16px;">
                                    {if $row['reset_flag'] == 1}
                                        <span style="display: inline-block; background: #fee2e2; color: #991b1b; padding: 4px 12px; border-radius: 6px; font-size: 12px; font-weight: 600;">
                                            <i class="fas fa-sync-alt mr-1"></i>重置
                                        </span>
                                    {else}
                                        <span style="display: inline-block; background: #dcfce7; color: #166534; padding: 4px 12px; border-radius: 6px; font-size: 12px; font-weight: 600;">
                                            <i class="fas fa-check-circle mr-1"></i>正常
                                        </span>
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>

                <!-- 重新查询按钮 -->
                <div class="text-center mt-8">
                    <button onclick="clearSearch()" style="background: none; border: none; color: #94a3b8; font-size: 13px; font-weight: 600; cursor: pointer; transition: 0.2s;" 
                            onmouseover="this.style.color='#3b82f6'" onmouseout="this.style.color='#94a3b8'">
                        <i class="fas fa-undo mr-1"></i> 查询其他用户
                    </button>
                </div>
            </div>

            {elseif $user_id}
            <!-- 无数据提示 -->
            <div id="no-data" class="text-center py-12">
                <div style="width: 80px; height: 80px; background: #f8fafc; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; margin-bottom: 20px;">
                    <i class="fas fa-chart-line" style="font-size: 32px; color: #94a3b8;"></i>
                </div>
                <h4 style="color: #1e293b; font-weight: 600; margin-bottom: 8px;">未找到流量记录</h4>
                <p style="color: #64748b; font-size: 14px; max-width: 300px; margin: 0 auto 24px;">
                    用户 #{$user_id} 最近 30 天内没有流量使用记录
                </p>
                <button onclick="clearSearch()" style="background: #3b82f6; color: white; border: none; border-radius: 12px; padding: 10px 24px; font-weight: 600; cursor: pointer; transition: all 0.2s;"
                        onmouseover="this.style.background='#2563eb'" onmouseout="this.style.background='#3b82f6'">
                    <i class="fas fa-redo mr-2"></i> 查询其他用户
                </button>
            </div>

            {else}
            <!-- 初始状态 -->
            <div id="initial-state" class="text-center py-12">
                <div style="width: 80px; height: 80px; background: linear-gradient(135deg, #e0f2fe, #dbeafe); border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; margin-bottom: 20px;">
                    <i class="fas fa-chart-bar" style="font-size: 32px; color: #3b82f6;"></i>
                </div>
                <h4 style="color: #1e293b; font-weight: 600; margin-bottom: 8px;">开始查询</h4>
                <p style="color: #64748b; font-size: 14px; max-width: 300px; margin: 0 auto;">
                    输入用户 ID 查看最近 30 天流量使用明细
                </p>
            </div>
            {/if}
        </div>
    </div>
</div>

{literal}
<script>
// 防止重复提交
let isSubmitting = false;

function searchUserTraffic() {
    if (isSubmitting) return;
    
    const uid = document.getElementById('user_id').value.trim();
    const searchBtn = document.getElementById('searchBtn');
    const btnText = document.getElementById('btnText');
    
    if (!uid) {
        showMessage('请输入用户 ID', 'warning');
        return;
    }
    
    if (uid <= 0 || isNaN(uid)) {
        showMessage('请输入有效的用户 ID', 'warning');
        return;
    }

    // 设置提交状态
    isSubmitting = true;
    
    // 显示加载状态
    if (searchBtn) {
        searchBtn.innerHTML = '<span class="spinner-border spinner-border-sm" style="width: 1rem; height: 1rem;"></span> 查询中...';
        searchBtn.disabled = true;
        searchBtn.style.opacity = '0.7';
    }
    
    // 显示全局加载状态
    const loadingEl = document.getElementById('loading');
    const resultEl = document.getElementById('result-section');
    const noDataEl = document.getElementById('no-data');
    const initialStateEl = document.getElementById('initial-state');
    
    if (loadingEl) loadingEl.style.display = 'block';
    if (resultEl) resultEl.style.display = 'none';
    if (noDataEl) noDataEl.style.display = 'none';
    if (initialStateEl) initialStateEl.style.display = 'none';
    
    // 执行跳转
    window.location.href = '/admin/user_traffic?user_id=' + encodeURIComponent(uid);
    
    // 5秒后重置按钮状态（防止页面跳转失败）
    setTimeout(() => {
        isSubmitting = false;
        if (searchBtn) {
            searchBtn.innerHTML = '<i class="fas fa-search"></i><span id="btnText">查询流量</span>';
            searchBtn.disabled = false;
            searchBtn.style.opacity = '1';
        }
        if (loadingEl) loadingEl.style.display = 'none';
    }, 5000);
}

function clearSearch() {
    window.location.href = '/admin/user_traffic';
}

function showMessage(message, type = 'info') {
    // 移除现有消息
    const existingMsg = document.querySelector('.temp-message');
    if (existingMsg) existingMsg.remove();
    
    // 创建新消息
    const msgDiv = document.createElement('div');
    msgDiv.className = 'temp-message';
    msgDiv.style.position = 'fixed';
    msgDiv.style.top = '20px';
    msgDiv.style.left = '50%';
    msgDiv.style.transform = 'translateX(-50%)';
    msgDiv.style.padding = '12px 24px';
    msgDiv.style.borderRadius = '12px';
    msgDiv.style.fontWeight = '600';
    msgDiv.style.fontSize = '14px';
    msgDiv.style.zIndex = '9999';
    msgDiv.style.boxShadow = '0 4px 12px rgba(0,0,0,0.1)';
    msgDiv.style.animation = 'fadeInDown 0.3s ease-out';
    
    // 设置颜色
    if (type === 'warning') {
        msgDiv.style.background = '#fef3c7';
        msgDiv.style.color = '#92400e';
        msgDiv.style.border = '1px solid #fde68a';
    } else {
        msgDiv.style.background = '#dbeafe';
        msgDiv.style.color = '#1e40af';
        msgDiv.style.border = '1px solid #bfdbfe';
    }
    
    msgDiv.textContent = message;
    document.body.appendChild(msgDiv);
    
    // 3秒后自动消失
    setTimeout(() => {
        if (msgDiv.parentNode) {
            msgDiv.style.animation = 'fadeOutUp 0.3s ease-out';
            setTimeout(() => {
                if (msgDiv.parentNode) msgDiv.remove();
            }, 300);
        }
    }, 3000);
}

// 页面加载完成后自动聚焦到输入框
document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('user_id');
    if (input && !input.value) {
        setTimeout(() => {
            input.focus();
        }, 100);
    }
    
    // 添加CSS动画
    const style = document.createElement('style');
    style.textContent = `
        @keyframes fadeInDown {
            from { opacity: 0; transform: translate(-50%, -20px); }
            to { opacity: 1; transform: translate(-50%, 0); }
        }
        @keyframes fadeOutUp {
            from { opacity: 1; transform: translate(-50%, 0); }
            to { opacity: 0; transform: translate(-50%, -20px); }
        }
    `;
    document.head.appendChild(style);
});
</script>
{/literal}