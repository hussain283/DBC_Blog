helpers do
  def create_post(post_hash, tags="")
    post = Post.create(post_hash)
    return post unless post.valid?
    
    tags.split(',').each do |tag_name|
      tag = Tag.find_or_create_by_name(tag_name.strip.downcase)
      post.tags << tag unless post.tags.include? tag
    end

    post
  end

  def update_post(id, post_hash, tags="")
    post = Post.find(id)
    post.update_attributes(post_hash)
    return post unless post.valid?
    
    post.tags.destroy_all

    tags.split(',').each do |tag_name|
      tag = Tag.find_or_create_by_name(tag_name.strip.downcase)
      post.tags << tag unless post.tags.include? tag
    end

    post
  end

  def get_tags(post_id)
    return "" if post_id == nil
    p Post.find(post_id).tags.map {|tag| tag.name}.join(',')
  end
end
