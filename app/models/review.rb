# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :product

  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1 }
  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :comment, length: { minimum: 1 , maximum:1000}

end
