class PostVotesController < ApplicationController
  
  def create
    post = Post.find(params[:id])

    new_vote = PostVote.new(:user => current_user, :post => post)
    # new_vote = PostVote.new(:user_id => current_user.id, :post_id => post.id)  
    if new_vote.save
      # this single already did the 
      render json: new_vote, status: 201
    end

  end

end