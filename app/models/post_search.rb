class PostSearch
  include ActiveModel::Model

  attr_accessor :search_title, :search_content

  def execute
    Post.ransack(title_eq: @search_title, content_eq: @search_content).result
  end
end
