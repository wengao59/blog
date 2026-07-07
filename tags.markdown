---
layout: page
title: 标签
permalink: /tags/
---

{% comment %}
  这里使用 jekyll-index-pages 插件会自动生成
  如果没有插件，可以用下面的代码手动生成标签云
{% endcomment %}

{% assign tags = site.posts | map: 'tags' | uniq | sort %}
{% for tag in tags %}
  <a href="/tags/{{ tag | slugify }}/" style="font-size: {{ tag | size | times: 10 | plus: 80 }}%">
    {{ tag }}
  </a>
{% endfor %}