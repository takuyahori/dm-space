FactoryBot.define do
  factory :cliant do
    email  {Faker::Internet.free_email}
    password  {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname  {Faker::Name.initials(number: 2)}
    last_name {"田中"}
    first_name  {"一郎"}
    profile  {"宜しくお願いします。"}
    diet_history  {"2年ほどダイエットをしています。"}
  end
end
