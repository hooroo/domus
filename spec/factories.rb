FactoryBot.define do
  factory :family do
    last_name "Liso"
    capability 3
  end

  factory :group do
     name "St. Luis"
     responsable_name "Miss Faget"
     responsable_contact "123-456-789"
     from_date "1.month"
     to_date "1.month + 5"
  end
end
