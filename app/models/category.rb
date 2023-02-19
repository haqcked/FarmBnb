class Category < ApplicationRecord
  has_many :animals, dependent: :delete_all

  validates :name, presence: true, uniqueness: true

end
