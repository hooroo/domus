class Family < ApplicationRecord
  has_many :trip_families
  has_many :trips, through: :trip_families

  validates :last_name, :capability, presence: true

  def self.by_last_name
    order("lower(last_name)")
  end

  def self.active
    where(active: true)
  end

  def self.inactive
    where(active: false)
  end

  def to_s
    last_name
  end

  def summary
    "#{last_name} (#{capability})"
  end
end
