FactoryBot.define do
  factory :user do
    nickname                 { 'test' }
    height                   { 155 }
    email                    { 'text@example' }
    password                 { '000000' }
    password_confirmation    { password }
  end
end
