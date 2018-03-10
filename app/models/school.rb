class School < ApplicationRecord
  has_many :trips

  validates :name,
    :responsible_name,
    presence: true

  validates :responsible_contact,
    presence: true,
    length: { minimum: 9 }
end
