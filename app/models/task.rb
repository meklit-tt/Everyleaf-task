class Task < ApplicationRecord
   validates :title ,  length: { maximum: 20 },  presence: true
   validates :detail , presence: true
   validates :deadline, presence: true
   validates :status, presence: true
   validates :priority, presence: true

   paginates_per 2

   #belongs_to :user

end
