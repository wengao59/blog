---
layout: page
title: 归档
permalink: /archive/
---

{% assign posts_by_year = site.posts | group_by_exp: "post", "post.date | date: '%Y'" %}

{% for year_group in posts_by_year %}
  <h2>{{ year_group.name }}</h2>
  <ul>
    {% for post in year_group.items %}
      <li>
        <time>{{ post.date | date: "%m月%d日" }}</time>
        <a href="{{ post.url }}">{{ post.title }}</a>
      </li>
    {% endfor %}
  </ul>
{% endfor %}