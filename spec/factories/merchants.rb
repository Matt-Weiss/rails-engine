FactoryBot.define do
  factory :merchant do
    sequence(:name) do |n|
      "MerchantName#{n}"
    end
    created_at do |n|
      DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
    end
  end
end
