FactoryBot.define do
  factory :user do
    f_name { "test user" }
    email { "user#{rand(100000)}@example.com" }
    password { "password" }
  end
end