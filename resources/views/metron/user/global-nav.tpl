<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>网址导航 &mdash; {$config["appName"]}</title>
        <link href="{$metron['assets_url']}/css/pages/users/global-nav.css" rel="stylesheet" type="text/css" />
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">🌍 热门网站 & 🤖 AI 导航</h2>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-column-fluid">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                            <div class="card-header">
                                                <div class="card-title">
                                                    <h3 class="card-label">网站导航</h3>
                                                </div>
                                            </div>
                                            <div style="background-color: #f8f9fa; border-left: 4px solid #3f6ad8; padding: 12px 15px; margin: 15px; border-radius: 4px; color: #555; font-size: 13px;">
                                                <i style="color: #3f6ad8;">ℹ</i>
                                                <span style="margin-left: 8px;">提示：部分网址需要使用非中国大陆地区网络才可以访问</span>
                                            </div>
                                            <div class="card-body">
                                                <div class="nav-container">
                                                    <input id="nav-search" class="form-control nav-search" placeholder="搜索网站 / AI / 工具" autocomplete="off">
                                                    <div id="nav-result" class="nav-result"></div>
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
        <style>
            .nav-search {
                width: 100%;
                padding: 12px;
                border-radius: 8px;
                border: 1px solid #ddd;
                margin-bottom: 20px;
                font-size: 14px;
            }

            .nav-search:focus {
                border-color: #3f6ad8;
                box-shadow: 0 0 0 0.2rem rgba(63, 106, 216, 0.25);
            }

            .nav-result {
                display: grid;
                gap: 20px;
            }

            .nav-group-title {
                margin: 15px 0 10px;
                font-size: 16px;
                font-weight: bold;
                color: #3f6ad8;
                border-bottom: 2px solid #3f6ad8;
                padding-bottom: 5px;
            }

            .nav-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(130px, 1fr));
                gap: 15px;
                margin-bottom: 10px;
            }

            .nav-item {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 15px;
                border: 1px solid #eee;
                border-radius: 10px;
                text-decoration: none;
                color: inherit;
                transition: all 0.3s ease;
                cursor: pointer;
            }

            .nav-item:hover {
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
                transform: translateY(-5px);
                border-color: #3f6ad8;
            }

            .nav-item img {
                width: 45px;
                height: 45px;
                border-radius: 8px;
                margin-bottom: 8px;
                object-fit: cover;
            }

            .nav-item-name {
                font-size: 13px;
                text-align: center;
                font-weight: 500;
                color: #333;
                word-break: break-word;
            }

            .nav-empty {
                text-align: center;
                padding: 40px;
                color: #999;
                font-size: 14px;
            }
        </style>

        <script>
            const NAV_DATA = [
                {
                    title: "🌍 全球热门",
                    list: [
                        { name: "YouTube", domain: "youtube.com" },
                        { name: "TikTok", domain: "tiktok.com" },
                        { name: "Netflix", domain: "netflix.com" },
                        { name: "Telegram", domain: "telegram.org" },
                        { name: "Twitter / X", domain: "twitter.com" },
                        { name: "Instagram", domain: "instagram.com" },
                        { name: "Steam", domain: "store.steampowered.com" },
                        { name: "Facebook", domain: "facebook.com" },
                        { name: "Reddit", domain: "reddit.com" },
                        { name: "Discord", domain: "discord.com" },
                        { name: "Twitch", domain: "twitch.tv" },
                        { name: "Wikipedia", domain: "wikipedia.org" }
                    ]
                },
                {
                    title: "🧰 常用工具",
                    list: [
                        { name: "Google 翻译", domain: "translate.google.com" },
                        { name: "Google Drive", domain: "drive.google.com" },
                        { name: "GitHub", domain: "github.com" },
                        { name: "Cloudflare", domain: "dash.cloudflare.com" },
                        { name: "Speedtest", domain: "speedtest.net" },
                        { name: "Stack Overflow", domain: "stackoverflow.com" },
                        { name: "Notion", domain: "notion.so" },
                        { name: "Figma", domain: "figma.com" },
                        { name: "Canva", domain: "canva.com" },
                        { name: "Adobe Creative", domain: "adobe.com" },
                        { name: "WinRAR", domain: "rarlab.com" },
                        { name: "7-Zip", domain: "7-zip.org" }
                    ]
                },
                {
                    title: "🤖 热门 AI",
                    list: [
                        { name: "ChatGPT", domain: "chat.openai.com" },
                        { name: "Claude", domain: "claude.ai" },
                        { name: "Gemini", domain: "gemini.google.com" },
                        { name: "Perplexity", domain: "perplexity.ai" },
                        { name: "Copilot", domain: "copilot.microsoft.com" },
                        { name: "Midjourney", domain: "midjourney.com" },
                        { name: "Stable Diffusion", domain: "stablediffusion.com" },
                        { name: "DeepSeek", domain: "deepseek.com" },
                        { name: "Kimi", domain: "kimi.moonshot.cn" },
                        { name: "文心一言", domain: "yiyan.baidu.com" }
                    ]
                },
                {
                    title: "💼 工作&学习",
                    list: [
                        { name: "LinkedIn", domain: "linkedin.com" },
                        { name: "Coursera", domain: "coursera.org" },
                        { name: "Udemy", domain: "udemy.com" },
                        { name: "Khan Academy", domain: "khanacademy.org" },
                        { name: "Duolingo", domain: "duolingo.com" },
                        { name: "Skillshare", domain: "skillshare.com" },
                        { name: "MasterClass", domain: "masterclass.com" },
                        { name: "Medium", domain: "medium.com" },
                        { name: "Dev.to", domain: "dev.to" }
                    ]
                },
                {
                    title: "🎮 游戏&娱乐",
                    list: [
                        { name: "Steam", domain: "store.steampowered.com" },
                        { name: "Epic Games", domain: "epicgames.com" },
                        { name: "GOG", domain: "gog.com" },
                        { name: "Origin", domain: "origin.com" },
                        { name: "Ubisoft+", domain: "ubisoft.com" },
                        { name: "Xbox Game Pass", domain: "gamepass.com" },
                        { name: "PlayStation Store", domain: "store.playstation.com" },
                        { name: "Nintendo eShop", domain: "nintendo.com" }
                    ]
                },
                {
                    title: "📊 数据&分析",
                    list: [
                        { name: "Google Analytics", domain: "analytics.google.com" },
                        { name: "Tableau", domain: "tableau.com" },
                        { name: "Power BI", domain: "powerbi.microsoft.com" },
                        { name: "Grafana", domain: "grafana.com" },
                        { name: "Mixpanel", domain: "mixpanel.com" },
                        { name: "Amplitude", domain: "amplitude.com" },
                        { name: "Statista", domain: "statista.com" }
                    ]
                },
                {
                    title: "💰 金融&投资",
                    list: [
                        { name: "Yahoo Finance", domain: "finance.yahoo.com" },
                        { name: "Bloomberg", domain: "bloomberg.com" },
                        { name: "Investing.com", domain: "investing.com" },
                        { name: "Binance", domain: "binance.com" },
                        { name: "Coinbase", domain: "coinbase.com" },
                        { name: "Kraken", domain: "kraken.com" },
                        { name: "Stripe", domain: "stripe.com" },
                        { name: "PayPal", domain: "paypal.com" }
                    ]
                },
                {
                    title: "🛒 购物&支付",
                    list: [
                        { name: "Amazon", domain: "amazon.com" },
                        { name: "eBay", domain: "ebay.com" },
                        { name: "AliExpress", domain: "aliexpress.com" },
                        { name: "Alibaba", domain: "alibaba.com" },
                        { name: "Shopify", domain: "shopify.com" },
                        { name: "Etsy", domain: "etsy.com" },
                        { name: "Wish", domain: "wish.com" },
                        { name: "Shein", domain: "shein.com" }
                    ]
                },
                {
                    title: "🌐 域名&主机",
                    list: [
                        { name: "Namecheap", domain: "namecheap.com" },
                        { name: "GoDaddy", domain: "godaddy.com" },
                        { name: "Bluehost", domain: "bluehost.com" },
                        { name: "DigitalOcean", domain: "digitalocean.com" },
                        { name: "Linode", domain: "linode.com" },
                        { name: "Vultr", domain: "vultr.com" },
                        { name: "AWS", domain: "aws.amazon.com" },
                        { name: "Google Cloud", domain: "cloud.google.com" },
                        { name: "Azure", domain: "azure.microsoft.com" }
                    ]
                },

                {
                    title: "🎨 设计&创意",
                    list: [
                        { name: "Dribbble", domain: "dribbble.com" },
                        { name: "Behance", domain: "behance.net" },
                        { name: "Unsplash", domain: "unsplash.com" },
                        { name: "Pexels", domain: "pexels.com" },
                        { name: "Pixabay", domain: "pixabay.com" },
                        { name: "Freepik", domain: "freepik.com" },
                        { name: "Icons8", domain: "icons8.com" },
                        { name: "Font Awesome", domain: "fontawesome.com" }
                    ]
                },
                {
                    title: "🚀 开发框架",
                    list: [
                        { name: "React", domain: "react.dev" },
                        { name: "Vue.js", domain: "vuejs.org" },
                        { name: "Angular", domain: "angular.io" },
                        { name: "Node.js", domain: "nodejs.org" },
                        { name: "Python.org", domain: "python.org" },
                        { name: "Laravel", domain: "laravel.com" },
                        { name: "Django", domain: "djangoproject.com" },
                        { name: "Spring Boot", domain: "spring.io" },
                        { name: "Docker", domain: "docker.com" },
                        { name: "Kubernetes", domain: "kubernetes.io" }
                    ]
                }
            ];

            function getIconUrl(domain) {
                return "https://www.google.com/s2/favicons?domain=" + domain + "&sz=64";
            }

            function debounce(fn, delay) {
                let timeout;
                return function(...args) {
                    clearTimeout(timeout);
                    timeout = setTimeout(() => fn(...args), delay);
                };
            }

            const resultContainer = document.getElementById("nav-result");
            const searchInput = document.getElementById("nav-search");

            function renderNav(keyword = "") {
                resultContainer.innerHTML = "";
                const lowerKeyword = keyword.toLowerCase();
                let hasResult = false;

                NAV_DATA.forEach(group => {
                    const filtered = group.list.filter(item =>
                        item.name.toLowerCase().includes(lowerKeyword) ||
                        item.domain.toLowerCase().includes(lowerKeyword)
                    );

                    if (!filtered.length) return;

                    hasResult = true;

                    const titleDiv = document.createElement("div");
                    titleDiv.className = "nav-group-title";
                    titleDiv.textContent = group.title;
                    resultContainer.appendChild(titleDiv);

                    const grid = document.createElement("div");
                    grid.className = "nav-grid";

                    filtered.forEach(item => {
                        const link = document.createElement("a");
                        link.href = "https://" + item.domain;
                        link.target = "_blank";
                        link.rel = "noopener noreferrer";
                        link.className = "nav-item";

                        const img = document.createElement("img");
                        img.src = getIconUrl(item.domain);
                        img.alt = item.name;
                        img.onerror = function() {
                            this.style.display = "none";
                        };

                        const name = document.createElement("div");
                        name.className = "nav-item-name";
                        name.textContent = item.name;

                        link.appendChild(img);
                        link.appendChild(name);
                        grid.appendChild(link);
                    });

                    resultContainer.appendChild(grid);
                });

                if (!hasResult && keyword) {
                    const empty = document.createElement("div");
                    empty.className = "nav-empty";
                    empty.textContent = "未找到匹配的网站";
                    resultContainer.appendChild(empty);
                } else if (!hasResult) {
                    renderNav("");
                }
            }

            document.addEventListener("DOMContentLoaded", function() {
                renderNav();
            });

            const debouncedSearch = debounce((value) => {
                renderNav(value);
            }, 200);

            searchInput.addEventListener("input", (e) => {
                debouncedSearch(e.target.value);
            });
        </script>
    </body>
</html>