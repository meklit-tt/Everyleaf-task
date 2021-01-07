class Task < ApplicationRecord
   validates  :title ,  length: { maximum: 20 },  presence: true
   validates :detail , presence: true
   validates :deadline, presence: true
   #belongs_to :user

end
