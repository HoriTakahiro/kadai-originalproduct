class RenameReviewColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :review, :good_or_bad
  end
end
