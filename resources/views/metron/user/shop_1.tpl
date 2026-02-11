<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VIP Membership Tiers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.8;
            margin: 20px;
            background-color: #f9f9f9;
            color: #333;
        }
        h1 {
            font-size: 2.5em;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 30px;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
        }
        .tier {
            flex: 1 1 calc(50% - 20px);
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            font-size: 1.8em;
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }
        p {
            font-size: 1.2em;
            margin: 8px 0;
        }
        strong {
            color: #4CAF50;
        }
        @media (max-width: 768px) {
            .tier {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>VIP Membership Tiers</h1>
        <div class="row">
            <div class="tier">
                <h2>VIP1 – 个人使用套餐 (轻度使用者)</h2>
                <p><strong>目标用户:</strong> 适合轻度使用者</p>
                <p><strong>节点数量:</strong> 20+ （未来将增加）</p>
                <p><strong>使用限制:</strong> 仅限个人使用</p>
                <p><strong>最佳用途:</strong> 基本上网浏览、偶尔视频观看或低带宽活动</p>
            </div>
            <div class="tier">
                <h2>VIP2 – 个人使用套餐 (中度视频观看使用者)</h2>
                <p><strong>目标用户:</strong> 适合中度视频观看使用者</p>
                <p><strong>节点数量:</strong> 目前20+，未来将增加至35+</p>
                <p><strong>使用限制:</strong> 仅限个人使用</p>
                <p><strong>最佳用途:</strong> 中等视频观看、一般带宽需求的活动</p>
            </div>
        </div>
        <div class="row">
            <div class="tier">
                <h2>VIP3 – 个人使用套餐 (高带宽需求使用者)</h2>
                <p><strong>目标用户:</strong> 适合对网速要求较高使用者</p>
                <p><strong>节点数量:</strong> 目前20+，未来将增加至45+</p>
                <p><strong>使用限制:</strong> 仅限个人使用</p>
                <p><strong>最佳用途:</strong> 高清视频流媒体、游戏、重度网络应用等高带宽需求</p>
            </div>
            <div class="tier">
                <h2>VIP4 – 共享套餐 (仅限同省市内多人使用)</h2>
                <p><strong>目标用户:</strong> 适合工作室和小公司使用</p>
                <p><strong>节点数量:</strong> 目前20+，未来将增加至45+</p>
                <p><strong>使用限制:</strong> 可以在同省市范围内多人共享使用</p>
                <p><strong>最佳用途:</strong> 小型工作室或公司、多用户共享上网，提供更多灵活性和带宽</p>
            </div>
        </div>
    </div>
</body>
</html>
