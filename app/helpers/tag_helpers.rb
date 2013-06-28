helpers do
  def search_for_posts(query_string)
  posts = []
  query = query_string.split.map {|term| "%#{term.downcase}%" }
  query.each {|query| posts += Tag.where('name LIKE ?',query).map {|tag| tag.posts}.flatten}
  posts.uniq!
  posts
  end
end
