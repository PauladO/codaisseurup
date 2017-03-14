class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  validate :starts_at_must_be_before_ends_at_time

  private

  def starts_at_must_be_before_ends_at_time
    errors.add(:starts_at, "must be before end time") unless
        starts_at < ends_at
  end

end
