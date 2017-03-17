class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def set_total_price
    self.price = event.price
    self.total = price * guest_count
  end
end
