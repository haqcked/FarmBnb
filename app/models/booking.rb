class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :total_price, numericality: true

end
