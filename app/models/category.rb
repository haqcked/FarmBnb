class Category < ApplicationRecord
  belongs_to :animal

  validates :name, presence: true, uniqueness: true

end
