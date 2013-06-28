get "/tag/search" do
  @posts = search_for_posts(params[:search])
  erb :home
end
