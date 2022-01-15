# frozen_string_literal: true

class StoreController < ApplicationController
  before_action :count
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
  end

  private

  def count
    session[:counter] = 0 if session[:counter].nil?
    session[:counter] += 1
  end
end
