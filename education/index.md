---
---

### 义务教育招生 + 中考 + 高考：

- [外地（随迁）子女义务教育问题导读]()

- [就地中考和高考招生/招录问题导读]({{ site.baseurl }}/pages/shengxue-intro)

{% for post in site.categories.education %}
+ [{{ post.title }}]({{ site.baseurl }}{{ post.url }})

Posted on {{ post.date | date: "%B %e, %Y" }}
{% endfor %}

