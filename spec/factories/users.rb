FactoryBot.define do
  factory :user do
    f_name { 'test user' }
    email { "user#{rand(100_000)}@example.com" }
    password { 'password' }
  end
end
