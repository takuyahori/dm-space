FactoryBot.define do
  factory :post do
    title  {"本日の食事"}
    date  {"2021-01-01"}
    explanation {"今日は朝食を食べることができず、2食になってしまいました。"}

    after(:build) do |post|
      post.images.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end