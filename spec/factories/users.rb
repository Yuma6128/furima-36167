FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@email.com' }
    password { 'test00' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { '1931-01-01' }
  end
end
