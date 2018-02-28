class Trip < ApplicationRecord
  belongs_to :school
  has_many :trip_families
  has_many :families, through: :trip_families

  validate :start_date_in_the_past
  validate :start_date_after_end_date
  validates(
    :end_date,
    :start_date,
    :total_boys,
    :total_bus_drivers,
    :total_girls,
    :total_teachers,
    presence: true,
  )

  delegate :name, to: :school, prefix: true

  def self.current(limit=10)
    where("end_date > ?", Time.current).limit(limit)
  end

  def self.past(limit=10)
    where("end_date <= ?", Time.current).limit(limit)
  end

  def self.by_start_date
    order(:start_date)
  end

  def name
    [school_name, start_date].join("-")
  end

  private

  def start_date_after_end_date
    if start_date && end_date && (end_date <= start_date)
      errors.add(
        :base,
        I18n.t(
          "activerecord.errors.models.trip.start_date_after_end_date",
        ),
      )
    end
  end

  def start_date_in_the_past
    if start_date && start_date < Date.today
      errors.add(
        :start_date,
        I18n.t(
          "activerecord.errors.models.trip.start_date_in_the_past",
        ),
      )
    end
  end
end
