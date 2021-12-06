FactoryBot.define do
  factory :comment do
    nickname {Faker::Name.initials(number: 2)}
    text {"素晴らしい！"}

    association :post
  end
end
