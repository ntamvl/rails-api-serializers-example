FactoryGirl.define do
  factory :post do
    title { FFaker::Lorem.sentence }
    body { FFaker::Lorem.paragraph }
  end
end
