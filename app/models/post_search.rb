class PostSearch
  include ActiveModel::Model  # ←postsコントローラーで使用
  attr_accessor :search_content

end
