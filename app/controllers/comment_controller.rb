class CommentController < ApplicationController
  def show
  end
  def new
    @comment = Comment.new
    @gossip = Gossip.find
  end
  def create
    @comment = Comment.new('content' => params[:content], 'gossip' )
    @comment.user = current_user
    if @comment.save
      redirect_to @gossip
     else
      render 'new'
    end
  end
  def edit
  end
  def destroy
  end
end