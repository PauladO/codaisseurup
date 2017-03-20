class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def set_total_price
    self.price = event.price
    self.total = price * guest_count
  end

  # def self.order_by_date
  #   order(created_at: :desc)
  # end

  scope :order_by_date, -> {order(created_at: :desc)}
end
