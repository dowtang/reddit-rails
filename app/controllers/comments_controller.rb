class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    # comment = current_user.comments.new(
    #   :contents => params [:content],
    #    :post_id => params [:post_id]
    #    )
    
    #We are just creating an object. We are not talking to the database at this stage
    comment = Comment.new(
      :content => params[:content],
      :post_id => params[:post_id],
      :user => current_user
      )

      #comment.save will either return TRUE or FALSE
      if comment.save
        #display
        render json: {data: comment, email: current_user.email}, status: 201 
      else
        #display
      end
    end

  end


#     if comment.save
#       redirect_to comment.post
#     else
#       redirect_to :back
#     end
#   end
  
# private
#   def comment_params
#     params.require(:comment).permit(:content, :post_id)
#   end
# end
