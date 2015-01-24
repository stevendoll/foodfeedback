FactoryGirl.define do
  sequence(:account_owner_email) { |n| "account_person#{n}@example.com" }
  sequence(:account_owner_name) { |n| "account_person#{n}" }
  sequence(:account_name) { |n| "account#{n}" }

  # factory :user, aliases: [:creator] do
  #   confirmed_at Time.now
  #   name :account_owner_name
  #   email :account_owner_email
  #   password "please123"
  #   association :account, factory: :account

  #   trait :admin do
  #     role 'admin'
  #   end

  #   trait :client do
  #     role 'client'
  #   end

  #   trait :practitioner do
  #     role 'practitioner'
  #   end
  # end

  factory :account do
    name :account_name
    #association :creator, factory: :user, last_name: "Writely"
    #creator # FactoryGirl.create(:user, :practitioner)
    creator_id "c2dc0ec7-6ce0-444d-8ef7-46f9fb312528" # some uuid
    #creator

    factory :account_with_clients do
      after(:create) do |account, evaluator|
        create_list(:user, 5, account: account)
      end
    end


  end


end

