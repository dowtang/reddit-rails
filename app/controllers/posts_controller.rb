class PostsController < ApplicationController
  def index
    @posts = Post.all
    
  end

  def new
    @post = Post.new
  end

  def create
    # post = Post.new(post_params)
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to posts_path
    else
      flash[:message] = post.errors.
        messages[:base]
        
      redirect_to :back
    end
  end

  # this basically retrieves the post with a specific id
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private
    def post_params
      params.require(:post).
        permit(:title, :url)
    end

end
