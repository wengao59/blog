---
layout: page
title: 分类
permalink: /categories/
---

{% assign categories = site.posts | map: 'categories' | uniq | sort %}
{% for category in categories %}
  <h3>
    <a href="/categories/{{ category | slugify }}/">
      {{ category }}
    </a>
  </h3>
  <ul>
    {% for post in site.posts %}
      {% if post.categories contains category %}
        <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
      {% endif %}
    {% endfor %}
  </ul>
{% endfor %}