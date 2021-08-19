class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_detail,
    against: [:name, :detail],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
