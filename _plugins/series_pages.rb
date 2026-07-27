# _plugins/series_pages.rb
# 为每个 series 生成独立的页面

Jekyll::Hooks.register :site, :post_read do |site|
  # 获取所有系列
  series_list = site.posts.docs.map { |p| p.data['series'] }.compact.uniq
  
  series_list.each do |series_name|
    # 生成安全的文件名
    slug = Jekyll::Utils.slugify(series_name)
    
    # 获取该系列的所有文章，按 series_part 排序
    series_posts = site.posts.docs.select { |p| p.data['series'] == series_name }
    series_posts.sort_by! { |p| p.data['series_part'].to_i }
    
    # 创建一个虚拟页面
    page = Jekyll::Page.new(site, site.source, '', 'series_template.html')
    page.data['layout'] = 'series'
    page.data['title'] = series_name
    page.data['permalink'] = "/series/#{slug}/"
    page.data['series_name'] = series_name
    page.data['series_posts'] = series_posts
    
    # 添加到站点
    site.pages << page
  end
end