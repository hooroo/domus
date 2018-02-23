class School < ApplicationRecord
  has_many :trips

  validates :name,
    :responsable_name,
    presence: true

  validates :responsable_contact,
    presence: true,
    length: { minimum: 9 }
end
