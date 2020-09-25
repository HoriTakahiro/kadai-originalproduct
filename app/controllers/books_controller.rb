class BooksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:update, :destroy]
  

  def new
    @book = current_user.books.build
  end

  def show
    @book = Book.find_by(id: params[:id])
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

  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end
  
  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to root_url
    end
  end
end
