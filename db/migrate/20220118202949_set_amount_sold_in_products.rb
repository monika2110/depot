# frozen_string_literal: true

class SetAmountSoldInProducts < ActiveRecord::Migration[6.1]
  def change
    Product.all.each do |product|
      product.amount_sold = product.line_items.where(cart_id: nil).group(:product_id).sum(:quantity).values.join.to_i
      product.save
    end
  end
end
