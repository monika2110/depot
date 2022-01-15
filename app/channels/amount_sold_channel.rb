# frozen_string_literal: true

class AmountSoldChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'amount_sold'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

# frozen_string_literal: true
