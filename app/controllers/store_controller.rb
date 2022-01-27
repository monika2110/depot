# frozen_string_literal: true

class StoreController < ApplicationController
  skip_before_action :authorize
  before_action :count
  include CurrentCart
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end

  private

  def count
    session[:counter] = 0 if session[:counter].nil?
    session[:counter] += 1
  end
end
