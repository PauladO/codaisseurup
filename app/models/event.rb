class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  # validates :starts_at_must_be_before_ends_at_time == true

  def is_free?
    price == 0
  end

  def self.order_by_price
    order(:price)
  end

  private
    def starts_at_must_be_before_ends_at_time
      if starts_at < ends_at
        errors.add(:starts_at, "must be before end time") unless
        true
      end
    end
end
