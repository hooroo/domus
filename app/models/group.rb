class Group < ApplicationRecord
  validates :name,
    :responsable_name,
    :responsable_contact,
    :from_date,
    :to_date,
    presence: true

  validate :from_date_in_the_past
  validate :from_date_after_to_date

  private

  def from_date_after_to_date
    if from_date.blank? || to_date.blank?
      return
    end

    if to_date <= from_date
      t(".group.new.from_date_after_to_date_error")
    end
  end

  def from_date_in_the_past
    if from_date.blank? || to_date.blank?
      return
    end

    if from_date < Date.today
      t(".group.new.from_date_in_the_past_error")
    end
  end
end
