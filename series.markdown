---
layout: page
title: 系列文章
permalink: /series/
---

{% assign series_posts = site.posts | group_by: "series" | sort: "name" %}

{% for series in series_posts %}
  {% if series.name != "" and series.name != nil %}
    <h2 id="{{ series.name | slugify }}">
      <a href="{{ "/series/" | relative_url }}{{ series.name | slugify }}/">
        {{ series.name }}
      </a>
      <span style="font-size:0.8rem;color:#999;font-weight:normal;">
        ({{ series.items | size }} 篇)
      </span>
    </h2>
    <ul>
      {% for post in series.items %}
        <li>
          <time>{{ post.date | date: "%Y-%m-%d" }}</time>
          <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        </li>
      {% endfor %}
    </ul>
  {% endif %}
{% endfor %}