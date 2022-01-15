# frozen_string_literal: true

module ApplicationHelper
  def render_if(condition, record)
    render record if condition
  end

  def set_time
    Time.now
  end

  def top_list
    Product.order(:amount_sold).reverse
  end
end
