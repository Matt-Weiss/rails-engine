FactoryBot.define do
  factory :merchant do
    sequence(:name) do |n|
      "MerchantName#{n}" 
    end
  end
end
