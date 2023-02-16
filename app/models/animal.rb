class Animal < ApplicationRecord
  has_one :category
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: true

end
