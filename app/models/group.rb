class Group < ApplicationRecord
  validates :name,
    :responsable_name,
    :responsable_contact,
    :from_date,
    :to_date,
    presence: true
end
