FactoryBot.define do
  factory :member do
    sequence(:email) { |n| "test#{n}@example.com" }   
    password { "password" }                           
    name { "テストユーザー" }
    self_introduction { "自己紹介文です" }
    user_status { 0 }                                 
  end
end
