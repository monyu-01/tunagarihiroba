FactoryBot.define do
  factory :notification do
    # モデルのアソシエーションの呼び出し
    # factory :memberの呼び出し
    association :visitor, factory: :member
    association :visited, factory: :member
  end
end