FactoryBot.define do
  factory :family do
    last_name "Smiriglia"
    capability { [2, 3, 4, 5].sample }
  end

  factory :group do
    name "Cegli Messapica"
    responsable_name "Maria"
    responsable_contact "339 7308986"
    start_date 1.month.from_now
    end_date 2.months.from_now
  end

  factory :trip do
    total_girls { [15, 16, 17, 18, 19, 20].sample }
    total_boys { [15, 16, 17, 18, 19, 20].sample }
    total_teachers { [2, 3, 4, 5].sample }
    total_bus_drivers { [0, 1, 2].sample }
    start_date 1.month.from_now
    end_date 2.months.from_now
    group
  end
end
