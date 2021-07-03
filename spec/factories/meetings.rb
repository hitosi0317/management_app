FactoryBot.define do
  factory :meeting do
    name                      { 'MyString' }
    start_time                { '2021-05-21 03:06:35' }
    association :user
  end
end
