class Animal < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: true

end
