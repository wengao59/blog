# _plugins/series_pages.rb
Jekyll::Hooks.register :site, :post_read do |site|
  series_list = site.posts.docs.map { |p| p.data['series'] }.compact.uniq
  
  series_list.each do |series_name|
    slug = Jekyll::Utils.slugify(series_name)
    series_posts = site.posts.docs.select { |p| p.data['series'] == series_name }
    series_posts.sort_by! { |p| p.data['series_part'].to_i }
    
    page = Jekyll::PageWithoutAFile.new(site, site.source, 'series', "#{slug}.html")
    page.data['layout'] = 'series'
    page.data['title'] = series_name
    page.data['permalink'] = "/series/#{slug}/"
    page.data['series_name'] = series_name
    page.data['series_posts'] = series_posts
    page.content = ''
    
    site.pages << page
  end
end