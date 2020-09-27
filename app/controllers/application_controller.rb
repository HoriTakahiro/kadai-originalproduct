class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def counts(user)
    @count_books = user.books.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
  
  def comment_count(book)
    @count_comments = book.comments.count
    @count_good_comments = book.comments.where(good_or_bad: 1).count
    @count_bad_comments = book.comments.where(good_or_bad: 0).count
  end

end
