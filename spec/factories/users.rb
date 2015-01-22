FactoryGirl.define do
  sequence(:email) { |n| "person#{n}@example.com" }
  sequence(:name) { |n| "person#{n}" }

  factory :user do
    confirmed_at Time.now
    name
    email
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

    trait :unconfirmed do
      confirmed_at nil
    end


  end
end
