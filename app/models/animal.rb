class Animal < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: true
  validates :address, presence: true

  include PgSearch::Model

  pg_search_scope :global_search,
  against: [ :name, :description ],
  associated_against: {
    user: [:first_name, :last_name],
    category: [:name]
  },
  using: {
    tsearch: { prefix: true }
  }


end
