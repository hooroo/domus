class Group < ApplicationRecord
  has_many :trips

  validates :name,
    :responsable_name,
    :start_date,
    :end_date,
    presence: true

  validates :responsable_contact, length: { minimum: 9 }, presence: true

  validate :start_date_in_the_past
  validate :start_date_after_end_date

  private

  def start_date_after_end_date
    if start_date && end_date && (end_date <= start_date)
      errors.add(
        :start_date,
        I18n.t(
          "activerecord.errors.models.group.start_date_after_end_date",
        ),
      )
    end
  end

  def start_date_in_the_past
    if start_date && start_date < Date.today
      errors.add(
        :start_date,
        I18n.t(
          "activerecord.errors.models.group.start_date_in_the_past",
        ),
      )
    end
  end
end
