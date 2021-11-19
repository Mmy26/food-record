FactoryBot.define do
  factory :post do
    content      { 'あああ' }
    timing_id    { 2 }
    amount_id    { 2 }

    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
