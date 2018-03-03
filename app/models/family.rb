class Family < ApplicationRecord
  validates_presence_of :last_name, :capability

  def self.by_last_name
    order("lower(last_name)")
  end

  def self.active
    where(active: true)
  end

  def self.inactive
    where(active: false)
  end
end
