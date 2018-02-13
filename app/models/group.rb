class Group < ApplicationRecord
  validates :name,
    :responsable_name,
    :responsable_contact,
    :start_date,
    :end_date,
    presence: true

  validate :start_date_in_the_past
  validate :start_date_after_end_date

  private

  def start_date_after_end_date
    if start_date.blank? || end_date.blank?
      return
    end

    if end_date <= start_date
      t(".group.new.start_date_after_end_date_error")
    end
  end

  def start_date_in_the_past
    if start_date.blank? || end_date.blank?
      return
    end

    if start_date < Date.today
      t(".group.new.start_date_in_the_past_error")
    end
  end
end
