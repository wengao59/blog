---
layout: page
title: 标签
permalink: /tags/
---

<style>
  /* 标签云容器 */
.tag-cloud {
    display: flex;
    flex-wrap: wrap;
    gap: 10px 16px;
    justify-content: center;
    padding: 20px 0 30px 0;
    margin-bottom: 30px;
    border-bottom: 2px solid #f0f0f0;
}

/* 每个标签的样式 */
.tag-cloud a {
    display: inline-block;
    padding: 4px 14px;
    background: #f5f7fa;
    border-radius: 20px;
    color: #1a73e8;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.2s ease;
    border: 1px solid transparent;
}

/* 鼠标悬停效果 */
.tag-cloud a:hover {
    background: #1a73e8;
    color: #fff;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(26, 115, 232, 0.3);
    border-color: #1a73e8;
}

/* 文章列表中的标签（可选） */
.post-tags {
    display: inline-block;
    font-size: 0.75rem;
    background: #f0f4f8;
    padding: 2px 10px;
    border-radius: 12px;
    color: #666;
}
</style>

<!-- 标签云（新样式，只保留这一个！） -->
<div class="tag-cloud">
{% assign all_tags = site.posts | map: "tags" | uniq | sort %}
{% for tag in all_tags %}
  {% assign tag_size = site.posts | where_exp: "post", "post.tags contains tag" | size %}
  <a href="{{ "/tags/" | relative_url }}{{ tag | slugify }}/" 
     style="font-size:{{ tag_size | times: 2 | plus: 14 }}px;">
    {{ tag }}
    <span style="font-size:0.6em;opacity:0.6;">({{ tag_size }})</span>
  </a>
{% endfor %}
</div>

<hr>

<!-- 按标签列出文章 -->
{% for tag in all_tags %}
  {% assign tag_posts = site.posts | where_exp: "post", "post.tags contains tag" %}
  <h2 id="{{ tag | slugify }}">{{ tag }}</h2>
  <ul>
    {% for post in tag_posts %}
      <li>
        <time>{{ post.date | date: "%Y-%m-%d" }}</time>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </li>
    {% endfor %}
  </ul>
{% endfor %}