<!DOCTYPE html>
<html lang="en">
<head>
    <title>安装及使用常见问题 &mdash; {$config["appName"]}</title>
    <link href="{$metron['assets_url']}/css/client/metron-icon.css" rel="stylesheet" type="text/css" />
    {include file='include/global/head.tpl'}

    <style>
        /* ✅ 基础容器 */
        .faq-wrapper {
            padding: 20px 0 80px;
        }

        /* ✅ 分类过滤器样式 */
        .faq-filter-container {
            display: flex;
            gap: 12px;
            margin-bottom: 35px;
            flex-wrap: wrap;
            justify-content: center;
        }
        .filter-btn {
            padding: 10px 24px;
            border-radius: 30px;
            border: 1px solid rgba(47, 128, 237, 0.2);
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            backdrop-filter: blur(5px);
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            font-weight: 500;
        }
        .filter-btn:hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: #fff;
        }
        .filter-btn.active {
            background: #fff;
            color: #2f80ed;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        /* ✅ 卡片网格：桌面端双列，移动端单列 */
        .faq-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(450px, 1fr));
            gap: 25px;
        }

        @media (max-width: 768px) {
            .faq-grid { grid-template-columns: 1fr; }
            .subheader { min-h-lg-150px !important; }
        }

        /* ✅ FAQ 卡片精修 */
        .faq-card {
            background: #fff;
            border-radius: 20px;
            border: 1px solid #f0f2f5;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            transition: all 0.4s ease;
            display: flex;
            flex-direction: column;
            height: fit-content;
            overflow: hidden;
        }
        .faq-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(47, 128, 237, 0.1);
            border-color: rgba(47, 128, 237, 0.2);
        }

        /* ✅ 问题区域 */
        .faq-header {
            padding: 24px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 18px;
            background: #fff;
        }
        .faq-q-icon {
            background: linear-gradient(135deg, #2f80ed, #56ccf2);
            color: #fff;
            min-width: 32px;
            height: 32px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 14px;
        }
        .faq-title {
            flex: 1;
            font-size: 16px;
            font-weight: 600;
            color: #2d3748;
            line-height: 1.4;
        }
        .faq-chevron {
            color: #cbd5e0;
            transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        /* ✅ 回答区域 */
        .faq-body {
            max-height: 0;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            background-color: #fcfdfe;
        }
        .faq-content {
            padding: 0 24px 24px 74px; /* 这里的 74px 是 Q 图标+间距，使文字对齐标题 */
            color: #4a5568;
            font-size: 14.5px;
            line-height: 1.8;
            border-top: 1px solid #f7fafc;
        }

        /* ✅ 激活状态 */
        .faq-card.active {
            border-color: #2f80ed;
        }
        .faq-card.active .faq-body {
            max-height: 1200px; /* 足够容纳长内容 */
            padding-top: 15px;
        }
        .faq-card.active .faq-chevron {
            transform: rotate(180deg);
            color: #2f80ed;
        }
        .faq-card.active .faq-header {
            background: #f8faff;
        }

        /* ✅ 内部提示框样式 */
        .faq-alert {
            background: #ebf4ff;
            border-left: 4px solid #2f80ed;
            padding: 12px 16px;
            border-radius: 8px;
            margin: 12px 0;
            font-size: 13.5px;
            color: #2c5282;
        }

        /* ✅ 返回顶部按钮 */
        #backToTop {
            position: fixed;
            bottom: 40px;
            right: 30px;
            display: none;
            background: #2f80ed;
            color: #fff;
            border: none;
            width: 48px;
            height: 48px;
            border-radius: 50%;
            font-size: 20px;
            cursor: pointer;
            box-shadow: 0 8px 20px rgba(47,128,237,0.3);
            transition: all 0.3s;
            z-index: 1000;
        }
        #backToTop:hover { transform: scale(1.1); background: #1c5dd6; }
    </style>
</head>

<body>
<div class="d-flex flex-column flex-root">
    <div class="d-flex flex-row flex-column-fluid page">
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
            {include file='include/global/menu.tpl'}

            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <div class="subheader min-h-lg-175px pt-5 pb-7 subheader-transparent" id="kt_subheader">
                    <div class="container d-flex flex-column">
                        <h2 class="text-white font-weight-bold my-2 mr-5">帮助中心 (FAQ)</h2>
                        <p class="text-white opacity-80">在这里您可以找到所有关于安装与使用的解决方案</p>
                        
                        <div class="faq-filter-container mt-8">
                            <button class="filter-btn active" onclick="filterFaq('all', this)">全部</button>
                            <button class="filter-btn" onclick="filterFaq('mobile', this)">手机端</button>
                            <button class="filter-btn" onclick="filterFaq('pc', this)">电脑端</button>
                            <button class="filter-btn" onclick="filterFaq('account', this)">账号套餐</button>
                        </div>
                    </div>
                </div>

                <div class="d-flex flex-column-fluid">
                    <div class="container faq-wrapper">
                       <!-- 下面仅展示 faq-grid 内部，直接替换你现在 faq-grid 即可 -->

<div class="faq-grid">

<!-- 01 安卓 -->
<div class="faq-card" data-category="mobile">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">01</div>
<div class="faq-title">安卓手机提示“安装已被阻止”怎么办？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
请前往手机设置，允许安装未知来源应用，一般路径为：设置 → 安全 → 安装未知应用。<br><br>
<div class="faq-alert">
<strong>小米 HyperOS 3（澎湃 OS）：</strong><br>
设置中搜索“病毒”，进入后关闭所有检测功能即可正常安装 Clash Meta / 极兔客户端。
</div>
</div></div></div>

<!-- 02 iOS -->
<div class="faq-card" data-category="mobile">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">02</div>
<div class="faq-title">iOS 无法直接安装客户端？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
由于 Apple 系统限制，iOS 无法直接安装第三方客户端。<br>
请使用海外 Apple ID 登录 App Store 下载 Shadowrocket（小火箭），具体流程请查看网站顶部“使用教程”。
</div></div></div>

<!-- 03 Edge -->
<div class="faq-card" data-category="pc">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">03</div>
<div class="faq-title">使用 Edge 浏览器下载提示不安全？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
这是因为客户端未申请微软数字签名。<br>
点击下载栏右侧“三个点” → 选择“保留” → “显示详细信息” → “仍要保留”即可完成下载，文件安全无毒。
</div></div></div>

<!-- 04 Windows -->
<div class="faq-card" data-category="pc">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">04</div>
<div class="faq-title">Windows 提示“未知发布者”或“已阻止运行”？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
因未申请昂贵的微软数字签名导致。<br>
点击“更多信息” → “仍要运行”即可正常安装使用，请放心文件安全。
</div></div></div>

<!-- 05 macOS -->
<div class="faq-card" data-category="pc">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">05</div>
<div class="faq-title">MacOS 提示文件损坏或无法验证开发者？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
前往“系统设置” → “安全性与隐私” → “通用”，点击下方“仍要打开”即可。
</div></div></div>

<!-- 06 套餐 -->
<div class="faq-card" data-category="account">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">06</div>
<div class="faq-title">套餐可以重复购买吗？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
可以。<br>
<strong>同套餐（如 VIP1 月付 / 年付）：</strong>流量重置时间顺延叠加。<br>
<strong>不同套餐（VIP1 / VIP2）：</strong>新套餐会直接覆盖旧套餐。<br>
<strong>活动套餐与普通套餐不可叠加。</strong>
</div></div></div>

<!-- 07 使用 -->
<div class="faq-card" data-category="account">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">07</div>
<div class="faq-title">怎么使用？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
请查看网站顶部“使用教程”，根据您的设备系统选择对应教程进行操作。
</div></div></div>

<!-- 08 定制客户端 -->
<div class="faq-card" data-category="mobile">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">08</div>
<div class="faq-title">定制客户端（极兔）获取不到节点或无法登录？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
请在使用教程页面选择对应系统后，点击“其他客户端”，下载 Clash 客户端并使用订阅链接导入。
</div></div></div>


<!-- 09 TikTok -->
<div class="faq-card" data-category="mobile">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">09</div>
<div class="faq-title">为什么不能看 TikTok？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
TikTok 会检测设备 SIM 卡及地区。<br>
国内插卡手机通常无法直接使用 App，建议使用网页版或自行搜索“TikTok 免拔卡”相关教程。
</div></div></div>

<!-- 10 全局代理 -->
<div class="faq-card" data-category="pc">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">10</div>
<div class="faq-title">怎么设置全局代理模式？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body"><div class="faq-content">
<strong>Windows：</strong><br>
Clash → Proxy → 选择 Global<br>
极兔客户端 → 代理模式 → 全局<br><br>

<strong>Android：</strong><br>
Clash → 设置 → 覆写 → 模式 → 全局模式<br>
极兔客户端 → 代理模式 → 全局<br><br>

<strong>Mac：</strong><br>
Clash → 出站模式 → 全局<br><br>

<strong>iOS：</strong><br>
全局路由 → 代理
</div></div></div>

<!-- 11 极兔客户端 connection reset -->
<div class="faq-card" data-category="mobile">
<div class="faq-header" onclick="toggleFaq(this)">
<div class="faq-q-icon">11</div>
<div class="faq-title">极兔客户端登录时提示 connection reset / read ECONNRESET？</div>
<i class="faq-chevron fas fa-chevron-down"></i>
</div>
<div class="faq-body">
    <div class="faq-content">
        目前在 <strong>福建、浙江</strong> 地区，部分网络环境下使用极兔客户端登录时，可能会出现
        <code>connection reset</code> 或 <code>read ECONNRESET</code 的提示。<br><br>

        这是由于当地网络对直连请求存在干扰导致，并非账号或套餐异常。<br><br>

        <div class="faq-alert">
            <strong>解决方案：</strong><br>
            请前往网站顶部 <strong>「使用教程」</strong> 页面，选择对应系统后，下载并使用
            <strong>Clash 客户端</strong> 进行订阅使用。
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

{include file='include/global/scripts.tpl'}

<script>
    // ✅ 切换折叠逻辑
    function toggleFaq(element) {
        const card = element.parentElement;
        const isActive = card.classList.contains('active');
        
        // 如果想点击一个时关闭其他，请取消下面代码的注释：
        // document.querySelectorAll('.faq-card').forEach(c => c.classList.remove('active'));

        card.classList.toggle('active');
    }

    // ✅ 分类过滤逻辑
    function filterFaq(category, btn) {
        // 切换按钮样式
        document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');

        // 过滤卡片内容
        const cards = document.querySelectorAll('.faq-card');
        cards.forEach(card => {
            const cardCat = card.getAttribute('data-category');
            if (category === 'all' || cardCat === category) {
                card.style.display = 'flex';
                // 触发一个简单的淡入效果
                card.style.opacity = '0';
                setTimeout(() => { card.style.opacity = '1'; }, 10);
            } else {
                card.style.display = 'none';
            }
        });
    }
</script>

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