class Family < ApplicationRecord
  validates_presence_of :last_name, :capability
end
