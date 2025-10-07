FactoryBot.define do
  factory :post do
    title { "テスト投稿タイトル" }
    body  { "これはテスト用の本文です。" }
    association :member
  end
end
