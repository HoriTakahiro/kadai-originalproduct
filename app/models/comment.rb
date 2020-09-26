class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates :good_or_bad, presence: true ,numericality: { only_integer: true }
  validates :simple, presence: true, length: { maximum: 40 }
  validates :additional, presence: true, length: { maximum: 140 }
end
