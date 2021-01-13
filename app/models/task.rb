class Task < ApplicationRecord
   validates :title ,  length: { maximum: 20 },  presence: true
   validates :detail , presence: true
   validates :deadline, presence: true
   validates :status, presence: true
   validates :priority, presence: true

   paginates_per 5

   STATUS_LIST = ["Unstarted", "Inprogress", "Completed"]

   belongs_to :user

end
