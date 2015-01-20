FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name "Test User"
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

    trait :client do
      role 'client'
    end

    trait :practitioner do
      role 'practitioner'
    end


  end
end
