class Trip < ApplicationRecord
  belongs_to :group

  validate :start_date_in_the_past
  validate :start_date_after_end_date
  validates :total_girls,
    :total_boys,
    :total_teachers,
    :total_bus_drivers,
    :start_date,
    :end_date,
    presence: true

  delegate :name, to: :group, prefix: true

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
