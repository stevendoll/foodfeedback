FactoryGirl.define do
  sequence(:account_owner_email) { |n| "account_person#{n}@example.com" }
  sequence(:account_owner_name) { |n| "account_person#{n}" }
  sequence(:account_name) { |n| "account#{n}" }


  factory :account do
    name :account_name
    creator_id "c2dc0ec7-6ce0-444d-8ef7-46f9fb312528" # some uuid

    factory :account_with_clients do
      after(:create) do |account, evaluator|
        create_list(:user, 5, account: account)
      end
    end


  end


end

