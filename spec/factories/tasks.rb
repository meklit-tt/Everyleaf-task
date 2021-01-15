FactoryBot.define do
  factory :task do
    title { 'test_title' }
    detail { 'test_detail' }
    deadline {'test_deadline'}
    status {'test_status'}
    priority {'test_priority'}
  end
end
