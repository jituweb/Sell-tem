                                {include file='user/help/head.tpl'}

                                <div class="search-results-wrapper">
                                    <div class="accordion accordion-solid accordion-panel accordion-svg-toggle mb-10" id="faq">
                                        {foreach $contents as $content}
                                        <div class="card p-5 mb-8 search-result-card {$metron['style_shadow']}">
                                            <div class="card-header search-result-header" id="faqHeading2-{$content->id}">
                                                <button class="card-title search-result-button" data-toggle="collapse" data-target="#faq2-{$content->id}" aria-expanded="false" aria-controls="faq2-{$content->id}" role="button">
                                                    <div class="search-result-badge">
                                                        <cite title="一级分类">{$classs[ $classs[$content->class]['upid'] ]['name']}</cite>
                                                    </div>
                                                    <div class="search-result-title-group">
                                                        <div class="search-result-title">{$content->title}</div>
                                                        <div class="search-result-category">
                                                            <cite title="二级分类">{$classs[$content->class]['name']}</cite>
                                                        </div>
                                                    </div>
                                                    <span class="search-result-icon">
                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                <polygon points="0 0 24 0 24 24 0 24" />
                                                                <path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391 12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961 L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721 C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908 12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z" fill="#000000" fill-rule="nonzero" />
                                                                <path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825 1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866 9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246 C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999)" />
                                                            </g>
                                                        </svg>
                                                    </span>
                                                </button>
                                            </div>
                                            <div id="faq2-{$content->id}" class="collapse search-result-content" aria-labelledby="faqHeading2-{$content->id}" data-parent="#faq">
                                                <div class="separator separator-dashed separator-border-3"></div>
                                                <div class="search-result-body font-size-h6 font-weight-normal text-dark-50">{$content->content}</div>
                                            </div>
                                        </div>
                                        {/foreach}
                                    </div>
                                </div>

                                <!-- 无法解决问题提示 -->
                                <div class="card card-custom p-6 mb-8 mb-lg-0 contact-us-section {$metron['style_shadow']}">
                                    <div class="card-body d-flex align-items-center justify-content-between flex-wrap">
                                        <div class="mr-4 flex-grow">
                                            <h3 class="{$style[$theme_style]['global']['title']} mb-4">文档中心无法解决问题？</h3>
                                            <p class="text-dark-50 font-size-lg mb-0">如果文档中心的内容无法解决您的问题，可通过工单与我们联系<br>开启工单前，请确保文档中心的内容对您没有提供帮助</p>
                                        </div>
                                        <a href="/user/ticket" class="btn btn-primary font-weight-bolder text-uppercase font-size-lg py-3 px-6 mt-4 mt-lg-0">联系我们</a>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    {include file='include/global/footer.tpl'}

                </div>
            </div>
        </div>

        <style>
            /* ========== 搜索结果页面优化 ========== */
            .search-results-wrapper {
                margin-top: 24px;
            }

            .search-result-card {
                border: 1px solid #e0e0e0;
                border-radius: 12px;
                overflow: hidden;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                background: white;
                margin-bottom: 16px;
            }

            .search-result-card:hover {
                border-color: #6c63ff;
                box-shadow: 0 12px 40px rgba(108, 99, 255, 0.12) !important;
            }

            /* 搜索结果头部 */
            .search-result-header {
                padding: 0 !important;
                border: none !important;
                background: transparent !important;
            }

            .search-result-button {
                width: 100%;
                padding: 20px 24px;
                border: none;
                background: transparent;
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: 16px;
                text-align: left;
                transition: background-color 0.2s ease;
            }

            .search-result-button:hover {
                background-color: #f8f9fa;
            }

            .search-result-button.collapsed .search-result-icon {
                transform: rotate(-90deg);
            }

            /* 分类徽章 */
            .search-result-badge {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                background: linear-gradient(135deg, #6c63ff 0%, #7d77ff 100%);
                color: white;
                padding: 6px 14px;
                border-radius: 6px;
                font-size: 12px;
                font-weight: 600;
                white-space: nowrap;
                flex-shrink: 0;
            }

            /* 标题组 */
            .search-result-title-group {
                flex: 1;
                min-width: 0;
                display: flex;
                flex-direction: column;
                gap: 6px;
            }

            .search-result-title {
                font-size: 16px;
                font-weight: 600;
                color: #2d3748;
                line-height: 1.4;
                word-break: break-word;
            }

            .search-result-category {
                font-size: 13px;
                color: #718096;
            }

            .search-result-category cite {
                font-style: normal;
                color: #a0aec0;
            }

            /* 展开图标 */
            .search-result-icon {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
                transition: transform 0.3s ease;
                color: #6c63ff;
            }

            /* 搜索结果内容 */
            .search-result-content {
                overflow: hidden;
            }

            .search-result-content.show {
                animation: slideDown 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }

            @keyframes slideDown {
                from {
                    opacity: 0;
                    max-height: 0;
                }
                to {
                    opacity: 1;
                    max-height: 2000px;
                }
            }

            .search-result-body {
                padding: 20px 24px;
                background: white;
                line-height: 1.8;
                border-top: 1px solid #f0f0f0;
            }

            .search-result-body p {
                margin-bottom: 12px;
                color: #4a5568;
            }

            .search-result-body p:last-child {
                margin-bottom: 0;
            }

            .search-result-body ul,
            .search-result-body ol {
                margin-left: 20px;
                margin-bottom: 16px;
            }

            .search-result-body li {
                margin-bottom: 8px;
                color: #4a5568;
            }

            .search-result-body code {
                background-color: #f0f0f0;
                padding: 2px 6px;
                border-radius: 4px;
                font-family: 'Courier New', monospace;
                font-size: 13px;
            }

            .search-result-body pre {
                background-color: #f5f5f5;
                padding: 16px;
                border-radius: 8px;
                overflow-x: auto;
                margin-bottom: 16px;
            }

            .search-result-body pre code {
                background-color: transparent;
                padding: 0;
            }

            /* 无法解决问题提示 */
            .contact-us-section {
                border: 2px solid #e0e0e0;
                border-radius: 12px;
                background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
                margin-top: 32px;
            }

            .contact-us-section:hover {
                border-color: #6c63ff;
                box-shadow: 0 8px 24px rgba(108, 99, 255, 0.1) !important;
            }

            .contact-us-section h3 {
                color: #2d3748;
                font-size: 20px;
            }

            .contact-us-section .btn {
                min-width: 150px;
            }

            /* 响应式设计 */
            @media (max-width: 768px) {
                .search-result-button {
                    flex-wrap: wrap;
                    gap: 12px;
                }

                .search-result-badge {
                    order: 3;
                    width: 100%;
                    justify-content: flex-start;
                }

                .search-result-title-group {
                    order: 2;
                    flex: 1;
                    width: 100%;
                }

                .search-result-icon {
                    order: 1;
                }

                .contact-us-section .card-body {
                    flex-direction: column;
                }

                .contact-us-section .btn {
                    width: 100%;
                }

                .search-result-body {
                    padding: 16px;
                }
            }

            /* 深色主题支持 */
            @media (prefers-color-scheme: dark) {
                .search-result-card {
                    background: #1a1a1a;
                    border-color: #333;
                }

                .search-result-button:hover {
                    background-color: #2a2a2a;
                }

                .search-result-title {
                    color: #e0e0e0;
                }

                .search-result-category {
                    color: #8b8b8b;
                }

                .search-result-body {
                    background: #1a1a1a;
                    border-top-color: #2a2a2a;
                    color: #b0b0b0;
                }

                .contact-us-section {
                    background: linear-gradient(135deg, #222 0%, #1a1a1a 100%);
                    border-color: #333;
                }

                .contact-us-section h3 {
                    color: #e0e0e0;
                }
            }
        </style>

        {include file='include/global/scripts.tpl'}

    </body>
</html>
