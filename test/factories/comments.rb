FactoryBot.define do
  factory :comment do
    comment_body { "テストコメント" }
    association :member   
    association :post     
  end
end
