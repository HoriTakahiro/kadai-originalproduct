class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @book = Book.find(params[:id])

  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'コメントの投稿に成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      render :new
    end
  end

  def destroy
  end
  
  private

  def comment_params
    params.require(:comment).permit(:review, :simple, :additional)
  end
end
