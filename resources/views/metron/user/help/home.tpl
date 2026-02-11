                                {include file='user/help/head.tpl'}

                                <div class="row">
                                    {$num = count($classList_L2)}
                                    {if $num % 2 != 0}
                                    {$dan = 1}
                                    {else}
                                    {$dan = 0}
                                    {/if}
                                    {foreach $classList_L2 as $list_L2}
                                    {if isset($dan) && $dan && $dan === $num}
                                    <div class="col-lg-12">
                                    {else}
                                    <div class="col-lg-6">
                                    {$dan=$dan+1}
                                    {/if}
                                        <div class="card card-custom mb-8 gutter-b card-stretch category-section {$metron['style_shadow']}">
                                            <!-- 分类头部 -->
                                            <div class="category-section-header">
                                                <div class="category-section-title-wrapper">
                                                    {if $list_L2->li != null}
                                                    <span class="category-section-icon {$list_L2->li}"></span>
                                                    {/if}
                                                    <h2 class="category-section-title">{$list_L2->name}</h2>
                                                </div>
                                                {if $list_L2->url}
                                                <a href="{$list_L2->url}" class="category-install-button">
                                                    <span class="button-icon">📥</span>
                                                    <span>安装教程</span>
                                                </a>
                                                {/if}
                                            </div>

                                            <!-- 分类内容 -->
                                            <div class="card-body p-0">
                                                <div class="accordion accordion-light accordion-light-borderless accordion-svg-toggle category-docs-accordion" id="tab-help-{$list_L2->id}">

                                                    {foreach $pageDoc as $doc}
                                                    {if $doc->class == $list_L2->id}
                                                    <div class="category-doc-item">
                                                        <div class="category-doc-header" id="a-{$doc->id}">
                                                            <button class="category-doc-button {if $doc->ontop != 1}collapsed{/if}" data-toggle="collapse" data-target="#b-{$doc->id}" aria-expanded="{if $doc->ontop == 1}true{else}false{/if}" aria-controls="b-{$doc->id}">
                                                                <span class="doc-button-icon">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                            <polygon points="0 0 24 0 24 24 0 24" />
                                                                            <path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391 12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961 L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721 C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908 12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z" fill="#000000" fill-rule="nonzero" />
                                                                            <path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825 1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866 9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246 C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999) " />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                                <span class="doc-button-title {$style[$theme_style]['global']['text']}">{$doc->title}</span>
                                                                {if $doc->ontop == 1}
                                                                <span class="doc-button-badge">热门</span>
                                                                {/if}
                                                            </button>
                                                        </div>
                                                        <div id="b-{$doc->id}" class="category-doc-content collapse {if $doc->ontop == 1}show{/if}" aria-labelledby="a-{$doc->id}" data-parent="#tab-help-{$list_L2->id}">
                                                            <div class="category-doc-body text-dark-50 font-size-lg">
                                                                {$doc->content}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    {/if}
                                                    {/foreach}

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {/foreach}
                                </div>

                            </div>
                        </div>
                    </div>
                    {include file='include/global/footer.tpl'}
                </div>
            </div>
        </div>
        
        <style>
            /* ========== 二级分类卡片优化 ========== */

            .category-section {
                border: 1px solid #e0e0e0;
                border-radius: 12px;
                overflow: hidden;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                background: white;
            }

            .category-section:hover {
                border-color: #6c63ff;
                box-shadow: 0 12px 40px rgba(108, 99, 255, 0.12) !important;
            }

            /* 分类头部样式 */
            .category-section-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 24px;
                border-bottom: 2px solid #f5f5f5;
                background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
                gap: 16px;
            }

            .category-section-title-wrapper {
                display: flex;
                align-items: center;
                gap: 12px;
                flex: 1;
                min-width: 0;
            }

            .category-section-icon {
                font-size: 28px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
            }

            .category-section-title {
                font-size: 18px;
                font-weight: 700;
                color: #2d3748;
                margin: 0;
                line-height: 1.3;
            }

            /* 安装教程按钮 */
            .category-install-button {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 10px 20px;
                background: linear-gradient(135deg, #6c63ff 0%, #7d77ff 100%);
                color: white;
                border-radius: 8px;
                font-weight: 600;
                font-size: 14px;
                text-decoration: none;
                transition: all 0.3s ease;
                white-space: nowrap;
                flex-shrink: 0;
            }

            .category-install-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 16px rgba(108, 99, 255, 0.25);
                color: white;
            }

            .category-install-button:active {
                transform: translateY(0);
            }

            .button-icon {
                font-size: 16px;
            }

            /* 文档列表容器 */
            .category-docs-accordion {
                display: flex;
                flex-direction: column;
            }

            .category-doc-item {
                border-bottom: 1px solid #f0f0f0;
                transition: background-color 0.2s ease;
            }

            .category-doc-item:last-child {
                border-bottom: none;
            }

            .category-doc-item:hover {
                background-color: #f8f9fa;
            }

            /* 文档按钮样式 */
            .category-doc-header {
                width: 100%;
            }

            .category-doc-button {
                width: 100%;
                display: flex;
                align-items: center;
                gap: 12px;
                padding: 16px 24px;
                border: none;
                background: transparent;
                cursor: pointer;
                transition: all 0.2s ease;
                text-align: left;
                font-size: 15px;
            }

            .category-doc-button:hover {
                background-color: #f0f0f0;
            }

            .category-doc-button.collapsed .doc-button-icon {
                transform: rotate(-90deg);
            }

            .doc-button-icon {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
                transition: transform 0.3s ease;
                color: #6c63ff;
            }

            .doc-button-title {
                flex: 1;
                font-weight: 500;
                color: #2d3748;
                min-width: 0;
                word-break: break-word;
            }

            /* 热门标签 */
            .doc-button-badge {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                background: linear-gradient(135deg, #ff6b6b 0%, #ff8787 100%);
                color: white;
                font-size: 12px;
                font-weight: 600;
                padding: 4px 12px;
                border-radius: 6px;
                flex-shrink: 0;
                margin-left: 8px;
            }

            /* 文档内容样式 */
            .category-doc-content {
                overflow: hidden;
            }

            .category-doc-content.show {
                animation: slideDown 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }

            @keyframes slideDown {
                from {
                    opacity: 0;
                    max-height: 0;
                }
                to {
                    opacity: 1;
                    max-height: 1000px;
                }
            }

            .category-doc-body {
                padding: 24px;
                background: white;
                line-height: 1.8;
                color: #4a5568;
            }

            .category-doc-body p {
                margin-bottom: 12px;
            }

            .category-doc-body p:last-child {
                margin-bottom: 0;
            }

            .category-doc-body ul,
            .category-doc-body ol {
                margin-left: 20px;
                margin-bottom: 16px;
            }

            .category-doc-body li {
                margin-bottom: 8px;
            }

            .category-doc-body code {
                background-color: #f0f0f0;
                padding: 2px 6px;
                border-radius: 4px;
                font-family: 'Courier New', monospace;
                font-size: 13px;
            }

            .category-doc-body pre {
                background-color: #f5f5f5;
                padding: 16px;
                border-radius: 8px;
                overflow-x: auto;
                margin-bottom: 16px;
            }

            .category-doc-body pre code {
                background-color: transparent;
                padding: 0;
            }

            /* 响应式设计 */
            @media (max-width: 768px) {
                .category-section-header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 12px;
                }

                .category-install-button {
                    width: 100%;
                    justify-content: center;
                }

                .category-doc-button {
                    padding: 12px 16px;
                }

                .category-doc-body {
                    padding: 16px;
                }

                .category-section-title {
                    font-size: 16px;
                }
            }

            /* 深色主题支持 */
            @media (prefers-color-scheme: dark) {
                .category-section {
                    background: #1a1a1a;
                    border-color: #333;
                }

                .category-section-header {
                    background: linear-gradient(135deg, #222 0%, #1a1a1a 100%);
                    border-bottom-color: #2a2a2a;
                }

                .category-section-title {
                    color: #e0e0e0;
                }

                .category-doc-button {
                    color: #e0e0e0;
                }

                .category-doc-button:hover {
                    background-color: #2a2a2a;
                }

                .category-doc-body {
                    background: #1a1a1a;
                    color: #b0b0b0;
                }

                .doc-button-title {
                    color: #e0e0e0;
                }

                .category-doc-item {
                    border-bottom-color: #2a2a2a;
                }
            }
        </style>

        {include file='include/global/scripts.tpl'}

    </body>
</html>
