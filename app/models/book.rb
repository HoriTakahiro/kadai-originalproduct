class Book < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :author, presence: true, length: { maximum: 10 }
  validates :description, presence: true, length: { maximum: 140 }

  has_many :comments
  
  #def comment(this_book)
  #  self.reviews.create(book_id: this_book.id)
  #end
end
