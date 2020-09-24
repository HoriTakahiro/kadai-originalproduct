class ToppagesController < ApplicationController
  def index
    if logged_in?
      @books = Book.order(created_at: :desc).page(params[:page])
    end
  end
end
