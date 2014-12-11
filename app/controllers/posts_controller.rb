class PostsController < ApplicationController
  def index
    @posts = Post.all
    
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(title: params[:title], url: params[:title])
    if post.save
      redirect_to posts_path
    end
  end

  # this basically retrieves the post with a specific id
  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).
        permit(:title, :url)
    end

end
