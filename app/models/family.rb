class Family < ApplicationRecord
  #polimorphism implementation
  has_many: hone_numbers, as: :contact
end
