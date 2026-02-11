<!DOCTYPE html>
<html lang="en">
    <head>
        <title>文档中心 &mdash; {$config["appName"]}</title>
        <link href="{$metron['assets_url']}/css/client/metron-icon.css" rel="stylesheet" type="text/css" />
        {include file='include/global/head.tpl'}
        <style>
            /* 分类卡片样式 - 现代化优化设计 */
            .category-cards-container {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(130px, 1fr));
                gap: 14px;
                margin-top: 28px;
                margin-bottom: 36px;
                padding: 0 4px;
            }

            .category-card {
                background: linear-gradient(135deg, #ffffff 0%, #f9f9fb 100%);
                border: 1.5px solid #e5e7eb;
                border-radius: 14px;
                padding: 18px 14px;
                cursor: pointer;
                transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
                text-decoration: none;
                color: inherit;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                min-height: 110px;
                position: relative;
                overflow: hidden;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
                backdrop-filter: blur(4px);
            }

            .category-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: linear-gradient(135deg, rgba(108, 99, 255, 0.05) 0%, rgba(108, 99, 255, 0) 100%);
                opacity: 0;
                transition: opacity 0.3s ease;
                pointer-events: none;
            }

            .category-card::after {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 2px;
                background: linear-gradient(90deg, #6c63ff, #7d77ff, transparent);
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .category-card:hover {
                border-color: #6c63ff;
                box-shadow: 0 12px 28px rgba(108, 99, 255, 0.18);
                transform: translateY(-5px);
                background: linear-gradient(135deg, #ffffff 0%, #f5f3ff 100%);
            }

            .category-card:hover::before {
                opacity: 1;
            }

            .category-card:hover::after {
                opacity: 1;
            }

            .category-card.active {
                border-color: #6c63ff;
                background: linear-gradient(135deg, #6c63ff 0%, #7d77ff 100%);
                color: white;
                box-shadow: 0 14px 34px rgba(108, 99, 255, 0.28);
                transform: translateY(-5px);
            }

            .category-card.active::before {
                background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, transparent 100%);
                opacity: 1;
            }

            .category-card-icon {
                font-size: 26px;
                margin-bottom: 8px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
                filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.08));
            }

            .category-card:hover .category-card-icon {
                transform: scale(1.12) rotate(8deg);
                filter: drop-shadow(0 4px 8px rgba(108, 99, 255, 0.2));
            }

            .category-card.active .category-card-icon {
                transform: scale(1.15);
                filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
            }

            .category-card-title {
                font-weight: 600;
                font-size: 13px;
                line-height: 1.35;
                color: #2d3748;
                letter-spacing: -0.3px;
                transition: all 0.35s ease;
            }

            .category-card:hover .category-card-title {
                color: #6c63ff;
                font-weight: 700;
            }

            .category-card.active .category-card-title {
                color: white;
                font-weight: 700;
            }

            /* 响应式设计 */
            @media (max-width: 768px) {
                .category-cards-container {
                    grid-template-columns: repeat(auto-fill, minmax(110px, 1fr));
                    gap: 12px;
                    margin-top: 20px;
                    margin-bottom: 28px;
                }

                .category-card {
                    padding: 14px 10px;
                    min-height: 95px;
                    border-radius: 12px;
                }

                .category-card-icon {
                    font-size: 22px;
                    margin-bottom: 6px;
                }

                .category-card-title {
                    font-size: 12px;
                }
            }

            
            /* 搜索栏已移除 */
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
                                        <h2 class="text-white font-weight-bold my-2 mr-5">文档中心</h2>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-column-fluid">
                            <div class="container">

                                <!-- 卡片式分类导航 -->
                                <div class="row mb-8">
                                    <div class="col-12">
                                        <h3 class="font-weight-bold text-dark mb-4">按类别浏览</h3>
                                        <div class="category-cards-container">
                                            {foreach $classList_L1 as $list_L1}
                                            <a href="/user/help?type={$list_L1->name}" class="category-card {if $pageType == $list_L1->id}active{/if}">
                                                {if $list_L1->li != null}
                                                <span class="category-card-icon {$list_L1->li}"></span>
                                                {/if}
                                                <div class="category-card-title">{$list_L1->name}</div>
                                            </a>
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
