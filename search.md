---
layout: page
title: 搜索
permalink: /search/
---

<div id="search"></div>

<!-- 加载 Pagefind 的样式和脚本 -->
<script src="{{ '/pagefind/pagefind-ui.js' | relative_url }}"></script>
<link rel="stylesheet" href="{{ '/pagefind/pagefind-ui.css' | relative_url }}" />

<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        new PagefindUI({
            element: "#search",
            // 告诉 Pagefind UI 去哪里找搜索索引文件
            bundlePath: "{{ '/pagefind/' | relative_url }}",
            // 告诉 Pagefind 搜索结果路径要加上 /blog 前缀
            baseUrl: "{{ '/' | relative_url }}"
        });
    });
</script>

<style>
    /* 搜索框容器样式，让它和你网站风格一致 */
    #search {
        margin: 20px 0;
        max-width: 100%;
    }
    /* 暗色模式适配（如果你有） */
    body.dark {
        --pagefind-ui-primary: #eeeeee;
        --pagefind-ui-text: #eeeeee;
        --pagefind-ui-background: #152028;
        --pagefind-ui-border: #152028;
        --pagefind-ui-tag: #152028;
    }
</style>