class User < ApplicationRecord
validates :name, presence: true, length: {maximum: 30}
validates :email, presence: true, uniqueness: true, length: {maximum: 255},
                  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
 before_validation {email.downcase!}
 has_secure_password
 validates :password, presence: true, length: {minimum: 6}

 validates  :admin ,  inclusion: {in: [ true ,  false ]}

 has_many :tasks , dependent: :destroy

 paginates_per 3


def not_destroy_admin
#  throw(:abort) if User.where(admin: true).count <= && self.admin == true
end
 end
