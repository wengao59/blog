---
layout: page
title: 系列文章
permalink: /series/
---

{% assign all_series = site.posts | map: "series" | compact | uniq | sort %}

{% for series_name in all_series %}
  {% assign series_posts = site.posts | where_exp: "post", "post.series == series_name" %}
  {% assign series_slug = series_name | slugify %}
  {% if series_posts.size > 0 %}
<h2 id="{{ series_slug }}">
  <a href="{{ "/series/" | relative_url }}{{ series_slug }}/">
    {{ series_name }}
  </a>
  <span style="font-size:0.8rem;color:#999;font-weight:normal;">
    ({{ series_posts.size }} 篇)
  </span>
</h2>
<ul>
  {% for post in series_posts %}
    <li>
      <time>{{ post.date | date: "%Y-%m-%d" }}</time>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
  {% endif %}
{% endfor %}