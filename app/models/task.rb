class Task < ApplicationRecord
  validates :title, presence: true
  validates :detail, presence: true
  belongs_to :user
  has_many :lables, dependent: :destroy
end
