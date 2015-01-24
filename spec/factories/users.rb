FactoryGirl.define do
  sequence(:email) { |n| "person#{n}@example.com" }
  sequence(:name) { |n| "person#{n}" }

  factory :user, aliases: [:creator] do
    confirmed_at Time.now
    name
    email
    password "please123"
    association :account, factory: :account

    trait :admin do
      role 'admin'
    end

    trait :client do
      role 'client'
    end

    trait :practitioner do
      role 'practitioner'
    end

    trait :practitioner_with_clients do
      role 'practitioner'
      association :account, factory: :account_with_clients
    end

    trait :unconfirmed do
      confirmed_at nil
    end

  end
end
