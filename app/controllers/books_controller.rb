class BooksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:update, :destroy]
  

  def new
    @book = current_user.books.build
  end


  
  def edit
    @book = current_user.books.find_by(id: params[:id])
  end
  
  def update
    if @book.update(book_params)
      flash[:success] = '本の編集に成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '本の編集に失敗しました。'
      render :edit
    end    
  end
  
  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = '本の登録に成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '本の登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @book.destroy
    flash[:success] = '投稿を削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  def comments
    @book = Book.find(params[:id])
  end
  
  def comment_new
    @book = Book.find(params[:id])
    @comment = @book.comments.build
  end
  
  def comment_create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'コメントの投稿に成功しました。'
      @book = Book.find(@comment.book_id)
      redirect_to comments_book_path(@book)
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      @book = Book.find(@comment.book_id)
      render action: :comment_new
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end
  
  def comment_params
    params.required(:comment).permit(:good_or_bad, :simple, :additional, :book_id)
  end
  
  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to root_url
    end
  end
end
