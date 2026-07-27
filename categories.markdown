---
layout: page
title: 分类
permalink: /categories/
---

{% assign categories = site.posts | group_by: "category" | sort: "name" %}

{% for category in categories %}
  {% if category.name != "" %}
    <h2 id="{{ category.name | slugify }}">
      <a href="{{ "/categories/" | relative_url }}{{ category.name | slugify }}/">
        {{ category.name }}
      </a>
      <span style="font-size:0.8rem;color:#999;">({{ category.items | size }})</span>
    </h2>
    <ul>
      {% for post in category.items %}
        <li>
          <time>{{ post.date | date: "%Y-%m-%d" }}</time>
          <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
          <!-- ↑ 这里必须有 | relative_url -->
        </li>
      {% endfor %}
    </ul>
  {% endif %}
{% endfor %}