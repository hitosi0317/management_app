FactoryBot.define do
  factory :motion do
    weight                    { '33' }
    plans1                    { '学習' }
    plans2                    { '学習' }
    plans3                    { '学習' }
    plans4                    { '学習' }
    plans5                    { '学習' }
    count1                    { '15:30' }
    count2                    { '16:30' }
    count3                    { '17:30' }
    count4                    { '18:30' }
    count5                    { '19:30' }
    memo                      {'テスト確認します'}
    association :user
  end
end
