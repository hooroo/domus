FactoryBot.define do
  factory :family do
    last_name "Smiriglia"
    capability { [2, 3, 4, 5].sample }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end

    trait :with_teacher do
      prof true
    end

    trait :without_teacher do
      prof false
    end

    trait :with_bus_driver do
      bus_driver true
    end

    trait :without_bus_driver do
      bus_driver false
    end

    factory :all_true_family,
      traits: [:active, :with_teacher, :with_bus_driver]

    factory :all_false_family,
      traits: [:inactive, :without_teacher, :without_bus_driver]
  end

  factory :school do
    name "Cegli Messapica"
    responsable_name "Maria"
    responsable_contact "3397308986"
  end

  factory :trip do
    total_girls { [15, 16, 17, 18, 19, 20].sample }
    total_boys { [15, 16, 17, 18, 19, 20].sample }
    total_teachers { [2, 3, 4, 5].sample }
    total_bus_drivers { [0, 1, 2].sample }
    start_date 1.month.from_now
    end_date 2.months.from_now
    school
  end
end
