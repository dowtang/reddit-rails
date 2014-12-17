class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      respond_to do |format|
        format.js { render "create.js.erb" }
        format.html { redirect_to @comment.post }
      end
    else
      respond_to do |format|
        format.js { render 'fail.js.erb' }
        format.html { redirect_to :back}
    end
  end
end



#     comment = current_user.comments.new(comment_params)

#     if comment.save
#       redirect_to comment.post
#     else
#       redirect_to :back
#     end
#   end
  
private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
