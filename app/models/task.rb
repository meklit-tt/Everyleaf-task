class Task < ApplicationRecord
   validates :title ,  length: { maximum: 20 },  presence: true
   validates :detail , presence: true
   validates :deadline , presence: true
   validates :status, presence: true
   validates :priority, presence: true , numericality: { only_integer: true, greater_than: -1, less_than: 4 }

   belongs_to :user, optional: true
   has_many :labellings, dependent: :destroy
   has_many :labels, through: :labellings

   paginates_per 3

   STATUS_LIST = [ "Unstarted", "Inprogress", "Completed"]
   PRIORITY_LIST = ["High", "Medium", "Low"]

  scope :search_status, -> (status){where('status = ?',status)}
  scope :search_title, -> (title){where('title LIKE ?',"%#{title}%")}


end
