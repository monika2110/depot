class CreateReviews < ActiveRecord::Migration[6.1]
  def changee
    create_table :reviews do |t|
      t.integer :rating

      t.timestamps
    end
  end
end
