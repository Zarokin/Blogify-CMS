require 'json'

class BlogifyCMS
  attr_accessor :posts, :categories, :authors

  def initialize
    @posts = []
    @categories = ["Tech", "Life"]
    @authors = ["zarokin", "guest"]
  end

  def add_post(title, content, author, category)
    @posts << { id: @posts.size+1, title: title, content: content, author: author, category: category }
  end

  def list_posts
    @posts.each do |p|
      puts "#{p[:title]} by #{p[:author]} in #{p[:category]}"
    end
  end

  def save_to_file(filename)
    File.open(filename, 'w') { |f| f.puts JSON.pretty_generate(@posts) }
  end

  def summary
    puts "Posts: #{@posts.size}"
    puts "Categories: #{@categories.size}"
    puts "Authors: #{authors.size}"
  end
end

cms = BlogifyCMS.new
cms.add_post("Hello CMS", "Welcome!", "zarokin", "Tech")
cms.add_post("Tech Trends", "Latest tech...", "guest", "Tech")
cms.list_posts
cms.save_to_file("posts.json")
cms.summary