class CommentsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def create
 	  @comment = Comment.create(comment_params)
    if @comment.save
 		  flash[:success] = "Comment created"
  	  redirect_to :back
 	  else
 		  @comments = []
  	  render 'static_pages/home'
 	  end
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :entry_id)
    end
end