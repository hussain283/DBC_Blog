get "/posts/new" do 
  @post = Post.new
  erb :post_form
end

post "/posts/create" do
  @post = create_post(params[:post], params[:tags])
  if @post.valid?
    redirect "/"
  else
    erb :post_form
  end
end

get "/posts/edit/:id" do 
  begin
    @post = Post.find(params[:id])
    erb :post_form
  rescue
    redirect "/"
  end
end

post "/posts/update/:id" do
  @post = update_post(params[:id], params[:post], params[:tags])
  if @post.valid?
    redirect "/"
  else
    erb :post_form
  end
end

get "/posts/delete/:id" do
  begin
    @post = Post.find(params[:id])
    @post.tags.clear
    @post.delete
  rescue    
  end
  redirect "/"
end

get "/posts/show/:id" do
  begin
    @post = Post.find(params[:id])
    erb :post_show
  rescue    
    redirect "/"
  end
end


