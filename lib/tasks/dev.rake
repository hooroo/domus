if Rails.env.development?
  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods

      Family.delete_all
      Group.delete_all
      Trip.delete_all

      create_list(
        :family,
        15,
        last_name: FFaker::NameIT.last_name,
        first_name: FFaker::NameIT.first_name,
        address: ["San Cesareo", "Zagarolo", "Colonna"].sample,
        animals: ["2 dogs", "5 cats", "1 horse", "ducks"].sample,
        preferred_gender: ["Female", "Male"].sample,
      )

      create_list(
        :group,
        5,
        name: FFaker::AddressFR.city,
        responsable_name: FFaker::NameFR.name,
        responsable_contact: FFaker::PhoneNumberFR.mobile_phone_number,
        notes: FFaker::Lorem.phrase,
      )

      Group.all.each do |group|
        create(:trip, group: group)
      end
    end
  end
end
