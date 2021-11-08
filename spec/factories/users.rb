FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'00000a'}
    password_confirmation {password}
    weight                {60}
    age                   {20}
    sex                   {'男'}
    height                {170}
  end
end