---
layout: page
title: 分类
permalink: /categories/
---

{% assign sorted_categories = site.categories | sort %}

{% for category in sorted_categories %}
  {% assign category_name = category[0] %}
  {% assign posts = category[1] %}
  
  <h2 id="{{ category_name | slugify }}">
    <a href="{{ "/categories/" | relative_url }}{{ category_name | slugify }}/">
      {{ category_name }}
    </a>
    <span style="font-size:0.8rem;color:#999;">({{ posts | size }})</span>
  </h2>
  <ul>
    {% for post in posts %}
      <li>
        <time>{{ post.date | date: "%Y-%m-%d" }}</time>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </li>
    {% endfor %}
  </ul>
{% endfor %}