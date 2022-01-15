# frozen_string_literal: true

class AddProductIdToReviews < ActiveRecord::Migration[6.1]
  def changee
    add_column :reviews, :product_id, :integer
  end
end
