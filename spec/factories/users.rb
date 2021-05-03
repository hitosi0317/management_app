FactoryBot.define do
  factory :user do
    nickname                 { 'test' }
    email                    { 'text@example' }
    password                 { '000000' }
    password_confirmation    { password }
  end
end
