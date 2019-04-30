FactoryBot.define do
  factory :customer do
    sequence(:first_name) do |n|
      "CustomerFirstName#{n}"
    end
    sequence(:last_name) do |n|
      "CustomerLastName#{n}"
    end
    created_at do |n|
      DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
    end
  end
end
