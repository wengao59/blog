---
layout: page
title: 系列
permalink: /series/
---

{% assign series_list = "" | split: "" %}
{% for post in site.posts %}
  {% if post.series %}
    {% assign series_list = series_list | push: post.series %}
  {% endif %}
{% endfor %}
{% assign unique_series = series_list | uniq | sort %}

{% for series_name in unique_series %}
  {% assign series_url = "/series/" | append: series_name | slugify | append: "/" %}
  <h3>
    <a href="{{ series_url | relative_url }}">
      {{ series_name }}
    </a>
  </h3>
  <ul>
    {% assign series_posts = site.posts | where: "series", series_name | sort: 'series_order' | default: 'date' %}
    {% for post in series_posts %}
      <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}