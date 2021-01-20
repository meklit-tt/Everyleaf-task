FactoryBot.define do
  factory :user do
    name { 'test_name' }
    email { 'test_email' }
    password {'test_password'}
    admin {'admin_status'}
  end
end
