FactoryGirl.define do
  factory :post do
    title 'Some post title'
    url 'http://some.url.com'
    description 'Some post description'

    trait :sent do
      sent_on Time.zone.now - 1.day
    end
  end
end
