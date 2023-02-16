class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user

  validates :start_date, presence: true, comparison: { greater_than: :end_date }
  validates :end_date, presence: true
  validates :total_price, numericality: true

end
