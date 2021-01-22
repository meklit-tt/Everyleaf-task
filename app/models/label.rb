class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :tasks, through: :labellings
  accepts_nested_attributes_for :labellings, :reject_if => proc { |a| 
     a['label_id'].blank? }
  accepts_nested_attributes_for :tasks
  belongs_to :user
  validates :name, presence: true

end
