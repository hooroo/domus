class Family < ApplicationRecord
  validates_presence_of :last_name, :capability
  #polimorphism implementation
  # has_many: phone_numbers, as: :contact
end
