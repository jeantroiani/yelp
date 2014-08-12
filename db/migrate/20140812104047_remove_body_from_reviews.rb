class RemoveBodyFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :body, :text
  end
end
