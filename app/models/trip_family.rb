class TripFamily < ApplicationRecord
  belongs_to :family
  belongs_to :trip

  validates :family, presence: true
  validates :trip, presence: true
end
