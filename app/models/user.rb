class User < ActiveRecord::Base
    has_many :orders
    has_many :baskets, through: :orders
    has_secure_password
    validates :user_name, uniqueness: true
end
