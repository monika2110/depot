# frozen_string_literal: true

class AddAmountSoldToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :amount_sold, :integer, default: 0
  end
end
